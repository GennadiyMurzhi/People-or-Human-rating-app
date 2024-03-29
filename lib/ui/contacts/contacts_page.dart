import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:people_rating_app/application/main_screen_cubit/main_screen_cubit.dart';
import 'package:people_rating_app/ui/contacts/contact_widget.dart';
import 'package:people_rating_app/ui/core/body_if_no_cache_error.dart';
import 'package:people_rating_app/ui/core/widgets/loading_widget.dart';
import 'package:people_rating_app/ui/core/widgets/page_headline_widget.dart';

class ContactsPage extends StatelessWidget {
  const ContactsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final contacts = BlocProvider.of<MainScreenCubit>(context).state.contacts;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const PageHeadlineWidget(
          headline: 'Contacts',
        ),
        BodyIfNoCacheError(
          body: Expanded(
            child: Stack(
              children: [
                if (contacts != null)
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
                  )
                else
                  loadingWidget,
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
        ),
      ],
    );
  }
}
