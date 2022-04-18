import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:people_rating_app/ui/core/widgets/bottom_navigation_bar_custom.dart';
import 'package:people_rating_app/ui/core/widgets/drawer_custom/drawer_custom.dart';

class Layout extends StatelessWidget {
  final String title;
  final bool drawerOrArrowBack;
  final bool bottomNavigationBar;
  final Widget child;

  const Layout({
    Key? key,
    required this.title,
    required this.drawerOrArrowBack,
    required this.bottomNavigationBar,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        leading: Builder(
          builder: (context) => IconButton(
            icon: SvgPicture.asset('resources/icons/svg/drawer_icon.svg'),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
        title: Text(title),
      ),
      drawer: const DrawerCustom(
        name: 'Name Surname',
        rating: 99.9,
      ),
      bottomNavigationBar: BottomNavigationBarCustom(),
      body: child,
    );
  }
}

