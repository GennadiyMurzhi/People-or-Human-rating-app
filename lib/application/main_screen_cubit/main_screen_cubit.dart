import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/infrastructure/contacts/contacts_repository.dart';

part 'main_screen_cubit.freezed.dart';

part 'main_screen_state.dart';

@injectable
class MainScreenCubit extends Cubit<MainScreenState> {
  final PageController _mainScreenPageController;
  final ContactsRepository _contactsRepository;

  MainScreenCubit(this._mainScreenPageController, this._contactsRepository)
      : super(MainScreenState.initialMainScreen());

  void onPageScroll(int pageIndexSelected) async {
    emit(
      state.copyWith(
        currentPageIndex: pageIndexSelected,
      ),
    );

    if (pageIndexSelected == 0) {
      final contactsFromPhone = await _contactsRepository.getContactsFromPhone();
      contactsFromPhone.fold(
        (noPermission) async => await _contactsFromServer(Contacts.empty()),
        (contactsFromPhone) async => await _contactsFromServer(contactsFromPhone),
      );
    }
  }

  void onTapToBottomBar(int pageIndexSelected) {
    _mainScreenPageController.animateToPage(
      pageIndexSelected,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future<void> _contactsFromCache({required bool isServerError}) async {
    final contactsFromCache = await _contactsRepository.getCashedContacts();
    contactsFromCache.fold(
      (cacheFailure) {
        emit(
          MainScreenState.emptyContacts(),
        );
      },
      (contactsFromCache) => isServerError
          ? emit(
              MainScreenState.emptyContacts().copyWith(
                contacts: contactsFromCache,
                serverError: true,
              ),
            )
          : emit(
              MainScreenState.emptyContacts().copyWith(
                contacts: contactsFromCache,
                noInternetConnection: true,
              ),
            ),
    );
  }

  Future<void> _contactsFromServer(Contacts contacts) async {
    final contactsFromServer = await _contactsRepository.compareContactsFromTheServer(contacts);
    contactsFromServer.fold(
      (serverFailure) => serverFailure.map(
        serverError: (serverError) async {
          await _contactsFromCache(isServerError: true);
        },
        noInternetConnection: (e) async {
          await _contactsFromCache(isServerError: false);
        },
      ),
      (contactsFromServer) => emit(
        MainScreenState.haveContacts(contactsFromServer),
      ),
    );
  }
}
