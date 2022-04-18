import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactWidget extends StatelessWidget {
  final String name;
  final int ratedYouCount;
  final int ratedItCount;

  const ContactWidget({
    Key? key,
    required this.name,
    required this.ratedYouCount,
    required this.ratedItCount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.secondary.withAlpha(180),
      borderRadius: const BorderRadius.all(Radius.circular(20)),
      onTap: () {},
      child: SizedBox(
        width: 161,
        child: Padding(
          padding: const EdgeInsets.all(5
          ),
          child: Column(
            children: [
              Container(
                width: 66,
                height: 66,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: SvgPicture.asset(
                  'resources/images/svg/person.svg',
                  width: 66,
                  height: 66,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 1,
                  bottom: 6,
                ),
                child: Text(
                  name,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
              Text(
                'rated you ' + ratedYouCount.toString() + ' times',
                style: Theme.of(context).textTheme.bodySmall,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  top: 5,
                  bottom: 25,
                ),
                child: Text(
                  'rated it ' + ratedYouCount.toString() + ' times',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
