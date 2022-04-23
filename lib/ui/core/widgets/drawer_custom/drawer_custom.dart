import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:people_rating_app/ui/core/widgets/drawer_custom/drawer_button.dart';

class DrawerCustom extends StatelessWidget {
  final String name;
  final double rating;

  const DrawerCustom({
    Key? key,
    required this.name,
    required this.rating,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 245,
      child: Drawer(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            ConstrainedBox(
              constraints: BoxConstraints(minHeight: MediaQuery.of(context).padding.top + 137, minWidth: 245),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFF0DA64F),
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(20),
                  ),
                ),
                margin: EdgeInsets.zero,
                padding: EdgeInsets.fromLTRB(40, MediaQuery.of(context).padding.top + 36, 15, 18),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 30,
                      height: 30,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset('resources/images/svg/person.svg'),
                    ),
                    const SizedBox(
                      height: 13,
                    ),
                    Text(
                      name.split(' ').map((e) => e[0].toUpperCase() + e.substring(1)).join(' '),
                      strutStyle: const StrutStyle(
                        leadingDistribution: TextLeadingDistribution.even,
                      ),
                      style: TextStyle(
                        fontSize: 16,
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Text(
                      'Rating ' + rating.toString(),
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).colorScheme.primary,
                        fontFamily: 'Roboto',
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: [
                const SizedBox(
                  height: 52,
                ),
                DrawerButton(
                  label: 'Qualities',
                  onTap: () {},
                ),
                DrawerButton(
                  label: 'Settings',
                  onTap: () {},
                ),
                DrawerButton(
                  label: 'About',
                  onTap: () {},
                ),
              ],
            ),
            const Spacer(),
            Padding(
              padding: const EdgeInsets.only(left: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'ver. 0.1 "Contacts"',
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Roboto',
                      fontWeight: FontWeight.w400,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Text(
                    'App based on Google flutter framework',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
          ],
        ),
      ),
    );
  }
}
