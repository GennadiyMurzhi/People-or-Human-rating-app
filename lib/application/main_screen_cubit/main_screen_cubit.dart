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
      final contacts = await _contactsRepository.getContactsFromPhone();

      contacts.fold(
        (failure) => emit(
          state.copyWith(
            contacts: Contacts.empty(),
          ),
        ),
        (contacts) => emit(
          state.copyWith(
            contacts: contacts,
          ),
        ),
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
}
