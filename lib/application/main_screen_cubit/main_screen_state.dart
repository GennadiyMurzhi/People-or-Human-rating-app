part of 'main_screen_cubit.dart';

@freezed
abstract class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    required String title,
    required bool drawerOrArrowBack,
    required int currentPageIndex,
    //Keys must be of contactsOfRegisteredUsers and contactsUnRegisteredUsers
    UpdatedContacts? contacts,
    Profile? profile,
    required bool isCacheError,
  }) = _MainSreenState;

  factory MainScreenState.initialMainScreen() => const MainScreenState(
        title: 'People rating',
        drawerOrArrowBack: true,
        currentPageIndex: 1,
        isCacheError: false,
      );
}
