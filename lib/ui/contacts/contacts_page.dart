import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_rating_app/application/main_screen_cubit/main_screen_cubit.dart';
import 'package:people_rating_app/ui/contacts/contact.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final contacts = BlocProvider.of<MainScreenCubit>(context).state.contacts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: double.infinity,
          color: Theme.of(context).colorScheme.primary,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 0, 0),
            child: Text(
              'Contacts',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              ListView(
                padding: const EdgeInsets.symmetric(
                  horizontal: 19,
                  vertical: 18,
                ),
                children: [
                  Center(
                    child: Wrap(
                      children: List.generate(
                        contacts.contacts.length,
                        (index) => ContactWidget(
                          name: contacts.contacts[index].name,
                          ratedYouCount: 0,
                          ratedItCount: 0,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                height: 18,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Theme.of(context).colorScheme.primary,
                      Theme.of(context).colorScheme.primary.withOpacity(0),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
