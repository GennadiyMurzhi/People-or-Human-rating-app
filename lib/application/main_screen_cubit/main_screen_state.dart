part of 'main_screen_cubit.dart';

@freezed
abstract class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    required String title,
    required bool drawerOrArrowBack,
    required int currentPageIndex,
    //Keys must be of contactsOfRegisteredUsers and contactsUnRegisteredUsers
    Map<String, Contacts>? contacts,
  }) = _MainSreenState;

  factory MainScreenState.initialMainScreen() => const MainScreenState(
        title: 'People rating',
        drawerOrArrowBack: true,
        currentPageIndex: 1,
      );

  factory MainScreenState.emptyContacts() => MainScreenState(
        title: 'People rating',
        drawerOrArrowBack: true,
        currentPageIndex: 0,
        contacts: {
          'contactsOfRegisteredUsers': Contacts.empty(),
          'contactsUnRegisteredUsers': Contacts.empty(),
        },
      );
}
