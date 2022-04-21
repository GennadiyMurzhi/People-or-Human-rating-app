import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:people_rating_app/domain/contacts/contacts.dart';
import 'package:people_rating_app/infrastructure/contacts/contacts_repository.dart';
import 'package:people_rating_app/ui/core/snack_bar_custom.dart';

part 'main_screen_cubit.freezed.dart';

part 'main_screen_state.dart';

@injectable
class MainScreenCubit extends Cubit<MainScreenState> {
  final PageController _mainScreenPageController;
  final ContactsRepository _contactsRepository;

  MainScreenCubit(this._mainScreenPageController, this._contactsRepository)
      : super(MainScreenState.initialMainScreen());

  void onPageScroll(int pageIndexSelected, BuildContext context) {
    if (pageIndexSelected == 0) {
      _contactsFromPhone(context);
    } else {
      emit(
        MainScreenState.initialMainScreen().copyWith(currentPageIndex: pageIndexSelected),
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
  //TODO: need to refactoring all the emits below
  void _contactsFromPhone(BuildContext context) async {
    final contactsFromPhone = await _contactsRepository.getContactsFromPhone();
    contactsFromPhone.fold(
      (noPermission) {
        /*ScaffoldMessenger.of(context).showMaterialBanner(BannerCustom(
          text: 'No permission for contacts',
          listAction: [
            {
              'label': 'try again',
              'onPressed': () => _contactsFromPhone(context),
            },
          ],
        ));*/
        ScaffoldMessenger.of(context).showSnackBar(SnackBarCustom(text: 'No permission for contacts'));
        _contactsFromServer(Contacts.empty(), context);
      },
      (contactsFromPhone) => _contactsFromServer(contactsFromPhone, context),
    );
  }

  void _contactsFromServer(Contacts contacts, BuildContext context) async {
    final contactsFromServer = await _contactsRepository.compareContactsFromTheServer(contacts);
    contactsFromServer.fold(
      (serverFailure) => serverFailure.map(
        serverError: (serverError) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBarCustom(text: 'Sorry, there\'s an error on the server'));
          _contactsFromCache(isServerError: true);
        },
        noInternetConnection: (e) {
          ScaffoldMessenger.of(context).showSnackBar(
              SnackBarCustom(text: 'You must be having problems with your Internet. Please check your connection'));
          _contactsFromCache(isServerError: false);
        },
      ),
      (contactsFromServer) => emit(
        MainScreenState.haveContacts(contactsFromServer),
      ),
    );
  }

  void _contactsFromCache({required bool isServerError}) async {
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
}
