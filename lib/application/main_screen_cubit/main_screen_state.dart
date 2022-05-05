part of 'main_screen_cubit.dart';

@freezed
abstract class MainScreenState with _$MainScreenState {
  const factory MainScreenState({
    required String title,
    required bool drawerOrArrowBack,
    required int currentPageIndex,
    UpdatedContacts? contacts,
    Profile? profile,
    required bool isCacheError,
    required bool isEvaluationsListExpanded,
    required bool isEvaluationsListDragTime,
    double? heightEvaluationsListDrag,
  }) = _MainSreenState;

  factory MainScreenState.initialMainScreen() => const MainScreenState(
        title: 'People rating',
        drawerOrArrowBack: true,
        currentPageIndex: 1,
        isCacheError: false,
        isEvaluationsListExpanded: false,
        isEvaluationsListDragTime: false,
      );
}
