part of 'main_screen_cubit.dart';

@freezed
abstract class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    required String title,
    required bool drawerOrArrowBack,
    required int currentPageIndex,
    required Contacts contacts,
  }) = _MainSreenState;

  factory MainScreenState.initialMainScreen() => MainScreenState(
        title: 'People rating',
        drawerOrArrowBack: true,
        currentPageIndex: 1,
        contacts: Contacts.empty(),
      );
}
