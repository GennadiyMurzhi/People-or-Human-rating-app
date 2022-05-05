import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_rating_app/application/main_screen_cubit/main_screen_cubit.dart';
import 'package:people_rating_app/domain/evaluation/evaluation.dart';
import 'package:people_rating_app/ui/evaluation/widgets/evaluation_widget.dart';

class EvaluationListSlideWidget extends StatelessWidget {
  final double expandedHeight;
  final double unExpandedHeight;
  final List<Evaluation> evaluations;

  const EvaluationListSlideWidget({
    Key? key,
    required this.expandedHeight,
    required this.unExpandedHeight,
    required this.evaluations,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double trackLength = expandedHeight - unExpandedHeight;

    return GestureDetector(
      onVerticalDragUpdate: (dragDetails) =>
          BlocProvider.of<MainScreenCubit>(context).onVerticalDragUpdateCubit(dragDetails, expandedHeight, unExpandedHeight),
      onVerticalDragEnd: BlocProvider.of<MainScreenCubit>(context).onVerticalDragEndCubit,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        height: BlocProvider.of<MainScreenCubit>(context).state.isEvaluationsListDragTime
            ? BlocProvider.of<MainScreenCubit>(context).state.heightEvaluationsListDrag
            : BlocProvider.of<MainScreenCubit>(context).state.isEvaluationsListExpanded
                ? expandedHeight
                : unExpandedHeight,
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(10),
          ),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3f000000),
              offset: Offset(0, -2),
              blurRadius: 2,
            )
          ],
        ),
        child: Column(
          children: [
            Container(height: 30),
            Expanded(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: ListView(
                  padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
                  children: List.generate(
                    evaluations.length + evaluations.length - 1,
                    (index) => index % 2 == 0
                        ? EvaluationWidget(
                            evaluatorName: evaluations[index ~/ 2].evaluatorName,
                            evaluatedSkills: evaluations[index ~/ 2].evaluatedSkills.skills,
                            hashTagList: evaluations[index ~/ 2].hashTagList,
                            photoUrl: null,
                          )
                        : Center(
                            child: Container(
                              height: 2,
                              margin: const EdgeInsets.fromLTRB(7, 3, 7, 10),
                              color: const Color(0xFFD2D6D9),
                            ),
                          ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
