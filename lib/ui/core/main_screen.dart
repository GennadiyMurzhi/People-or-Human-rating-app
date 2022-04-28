import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_rating_app/application/main_screen_cubit/main_screen_cubit.dart';
import 'package:people_rating_app/injection.dart';
import 'package:people_rating_app/ui/contacts/contacts_page.dart';
import 'package:people_rating_app/ui/core/layout.dart';
import 'package:people_rating_app/ui/profile/profile_page.dart';
import 'package:permission_handler/permission_handler.dart';

class MainScreen extends StatelessWidget{
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return BlocProvider(
      create: (context) => getIt<MainScreenCubit>(),
      child: BlocBuilder<MainScreenCubit, MainScreenState>(
        builder: (context, state) => Layout(
          title: state.title,
          drawerOrArrowBack: state.drawerOrArrowBack,
          bottomNavigationBar: true,
          child: PageView(
            controller: getIt<PageController>(),
            onPageChanged: (index) => BlocProvider.of<MainScreenCubit>(context).onPageScroll(index),
            children: <Widget>[
              ContactsPage(),
              ProfilePage(),
              Text('\n\n\n\n\n\n\nThe page of evaluations will be', textAlign: TextAlign.center, style: Theme.of(context).textTheme.headlineSmall,),
            ],
          ),

        ),
      ),
    );
  }

}