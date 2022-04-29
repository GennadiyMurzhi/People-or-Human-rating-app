import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_rating_app/application/main_screen_cubit/main_screen_cubit.dart';

class BodyIfNoCacheError extends StatelessWidget {
  final Widget body;

  const BodyIfNoCacheError({
    Key? key,
    required this.body,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider.of<MainScreenCubit>(context).state.isCacheError ? Container() : body;
  }
}
