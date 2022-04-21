part of 'main_screen_cubit.dart';

@freezed
abstract class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    required String title,
    required bool drawerOrArrowBack,
    required int currentPageIndex,
    //Keys must be of contactsOfRegisteredUsers and contactsUnRegisteredUsers
    Map<String, Contacts>? contacts,
    required bool serverError,
    required bool noInternetConnection,
    required bool noPermission,
  }) = _MainSreenState;

  factory MainScreenState.initialMainScreen() => const MainScreenState(
        title: 'People rating',
        drawerOrArrowBack: true,
        currentPageIndex: 1,
        serverError: false,
        noInternetConnection: false,
        noPermission: false,
      );

  factory MainScreenState.emptyContacts() => MainScreenState(
        title: 'People rating',
        drawerOrArrowBack: true,
        currentPageIndex: 0,
        contacts: {
          'contactsOfRegisteredUsers': Contacts.empty(),
          'contactsUnRegisteredUsers': Contacts.empty(),
        },
        serverError: false,
        noInternetConnection: false,
        noPermission: false,
      );

  factory MainScreenState.haveContacts(Map<String, Contacts> contacts) => MainScreenState(
        title: 'People rating',
        drawerOrArrowBack: true,
        currentPageIndex: 0,
        contacts: contacts,
        serverError: false,
        noInternetConnection: false,
        noPermission: false,
      );

}
