import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:people_rating_app/application/main_screen_cubit/main_screen_cubit.dart';

class BottomNavigationBarCustom extends StatelessWidget{

  const BottomNavigationBarCustom({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Container(
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.vertical(top: Radius.circular(10)),
        boxShadow: [
          BoxShadow(color: Color(0x44000000), spreadRadius: 0, blurRadius: 4),
        ],
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
        child: BottomNavigationBar(
          selectedFontSize: 0,
          unselectedFontSize: 0,
          items: [
            BottomNavigationBarItem(
              icon: SvgPicture.asset('resources/icons/svg/contacts_icon.svg'),
              activeIcon: SvgPicture.asset(
                'resources/icons/svg/contacts_icon.svg',
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('resources/icons/svg/person_icon.svg'),
              activeIcon: SvgPicture.asset(
                'resources/icons/svg/person_icon.svg',
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: SvgPicture.asset('resources/icons/svg/star_rate_icon.svg'),
              activeIcon: SvgPicture.asset(
                'resources/icons/svg/star_rate_icon.svg',
                color: Theme.of(context).colorScheme.secondary,
              ),
              label: '',
            ),
          ],
          currentIndex: BlocProvider.of<MainScreenCubit>(context).state.currentPageIndex,
          onTap: (index) => BlocProvider.of<MainScreenCubit>(context).onTapToBottomBar(index),
        ),
      ),
    );
  }
}
