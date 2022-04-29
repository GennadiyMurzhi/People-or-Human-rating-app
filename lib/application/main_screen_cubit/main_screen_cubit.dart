import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/auth/user.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/domain/contacts/i_contacts_repository.dart';
import 'package:people_rating_app/domain/core/failures.dart';
import 'package:people_rating_app/domain/profile/i_profile_repository.dart';
import 'package:people_rating_app/domain/profile/profile.dart';
import 'package:people_rating_app/ui/core/layout.dart';
import 'package:people_rating_app/ui/core/widgets/actions_params.dart';
import 'package:people_rating_app/ui/core/widgets/dilog_custom.dart';
import 'package:people_rating_app/ui/core/widgets/snack_bar_custom.dart';

part 'main_screen_cubit.freezed.dart';

part 'main_screen_state.dart';

@injectable
class MainScreenCubit extends Cubit<MainScreenState> {
  final PageController _mainScreenPageController;
  final IContactsRepository _contactsRepository;
  final IProfileRepository _profileRepository;

  final _fakeUser = const User(phoneNumberId: '+38099221111');

  MainScreenCubit(
    this._mainScreenPageController,
    this._contactsRepository,
    this._profileRepository,
  ) : super(MainScreenState.initialMainScreen());

  void onPageScroll(int pageIndexSelected) async {
    ScaffoldMessenger.of(layoutKey.currentContext!).clearSnackBars();
    if (pageIndexSelected == 0) {
      _firstEmitOnScroll(pageIndexSelected);

      if (!await _contactsRepository.isContactAccess) {
        showDialog(
          context: layoutKey.currentContext!,
          builder: (context) => DialogCustom(
            titleDialog: 'Need access to contacts',
            text:
                'People Rating needs access to your contacts on your phone in order to know who is registered in the rating from your phonebook. Otherwise, it will download contacts that were known about before',
            listActions: [
              ActionParams(
                label: 'Grant',
                onPressed: () => _runGrunt(),
              ),
              ActionParams(
                label: 'Deny',
                onPressed: () => _runNoPermission(),
              ),
            ].reversed.toList(growable: false),
            icon: Icons.contacts_outlined,
            context: context,
          ),
        );
      } else {
        _contactsFromPhone();
      }
    } else if (pageIndexSelected == 1) {
      onProfilePage();
    } else {
      _firstEmitOnScroll(pageIndexSelected);
    }
  }

  void onTapToBottomBar(int pageIndexSelected) {
    _mainScreenPageController.animateToPage(
      pageIndexSelected,
      duration: const Duration(milliseconds: 100),
      curve: Curves.easeInOut,
    );
  }

  void onProfilePage() async {
    _firstEmitOnScroll(1);

    final profileFromServer = await _profileRepository.getProfileInfoFromServer(_fakeUser);
    profileFromServer.fold(
      (serverFailure) => _runServerFailureMap(
        serverFailure,
        () async {
          final profileFromCache = await _profileRepository.getCachedProfileInfo();
          profileFromCache.fold(
            (cacheFailure) => emit(
              state.copyWith(
                isCacheError: true,
              ),
            ),
            (profile) => _updateProfileEmit(profile),
          );
        },
      ),
      (profile) => _updateProfileEmit(profile),
    );
  }

  void _updateProfileEmit(Profile profile) {
    emit(
      state.copyWith(
        profile: profile,
        isCacheError: false,
      ),
    );
  }

  void _firstEmitOnScroll(int pageIndexSelected) {
    emit(
      state.copyWith(
        currentPageIndex: pageIndexSelected,
        isCacheError: false,
      ),
    );
  }

  void _contactsFromPhone() async {
    final contactsFromPhone = await _contactsRepository.getContactsFromPhone();
    contactsFromPhone.fold(
      (noPermission) => _runNoPermission(),
      (contactsFromPhone) => _contactsFromServer(contactsFromPhone),
    );
  }

  void _contactsFromServer(Contacts contacts) async {
    final contactsFromServer = await _contactsRepository.compareContactsFromTheServer(contacts);
    contactsFromServer.fold(
      (serverFailure) => _runServerFailureMap(serverFailure, _contactsFromCache),
      (contactsFromServer) => emit(
        state.copyWith(
          contacts: contactsFromServer,
          isCacheError: false,
        ),
      ),
    );
  }

  void _contactsFromCache() async {
    final contactsFromCache = await _contactsRepository.getCashedContacts();
    contactsFromCache.fold(
      (cacheFailure) {
        emit(
          state.copyWith(
            isCacheError: true,
          ),
        );
      },
      (contactsFromCache) => emit(
        state.copyWith(
          contacts: contactsFromCache,
          isCacheError: false,
        ),
      ),
    );
  }

  void _runServerFailureMap(ServerFailure serverFailure, Function fromCacheFun) {
    serverFailure.map(
      serverError: (serverError) => _runServerError(fromCacheFun),
      noInternetConnection: (e) => _runNoInternetConnection(fromCacheFun),
    );
  }

  void _runGrunt() async {
    _contactsFromPhone();
    if (!await _contactsRepository.isContactAccess) {
      _runSnackBar(
        text: 'Can\'t request access to contacts. Please provide access in the phone settings',
      );
    }
  }

  void _runNoPermission() async {
    _contactsFromServer(
      Contacts.empty(),
    );
    _runSnackBar(
      text: 'No permission for contacts',
    );
  }

  void _runServerError(Function fromCacheFun) async {
    fromCacheFun();
    _runSnackBar(
      text: 'Sorry, there\'s an error on the server',
    );
  }

  void _runNoInternetConnection(Function fromCacheFun) async {
    fromCacheFun();
    _runSnackBar(
      text: 'You must be having problems with your Internet. Please check your connection',
    );
  }

  void _runSnackBar({
    required String text,
  }) =>
      ScaffoldMessenger.of(layoutKey.currentContext!).showSnackBar(
        SnackBarCustom(
          text: text,
        ),
      );
}
