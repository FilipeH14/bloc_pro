import 'package:bloc_pro/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:bloc_pro/models/contact_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

class ContactsListPage extends StatelessWidget {
  const ContactsListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('contact list')),
      body: BlocListener<ContactListBloc, ContactsListState>(
        listenWhen: (previous, current) => current.maybeWhen(
          error: (error) => true,
          orElse: () => false,
        ),
        listener: (context, state) {
          state.whenOrNull(error: (error) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              backgroundColor: Colors.red,
              content: Text(
                error,
                style: const TextStyle(color: Colors.white),
              ),
            ));
          });
        },
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              child: Column(
                children: [
                  BlocSelector<ContactListBloc, ContactsListState,
                      List<ContactModel>>(
                    selector: (state) {
                      return state.maybeWhen(
                        data: (contacts) => contacts,
                        orElse: () => [],
                      );
                    },
                    builder: (_, contacts) {
                      return ListView.builder(
                        shrinkWrap: true,
                        itemCount: contacts.length,
                        itemBuilder: (context, index) {
                          final contact = contacts[index];
                          return ListTile(
                            title: Text(contact.name),
                            subtitle: Text(contact.email),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
