import 'package:bloc_pro/features/bloc_exemple/bloc/example_bloc.dart';
import 'package:bloc_pro/features/bloc_exemple/bloc_example.dart';
import 'package:bloc_pro/features/bloc_exemple/bloc_freezed_example.dart';
import 'package:bloc_pro/features/contacts/list/bloc/contact_list_bloc.dart';
import 'package:bloc_pro/features/contacts/list/contacts_list_page.dart';
import 'package:bloc_pro/features/contacts/register/contact_register_page.dart';
import 'package:bloc_pro/features/contacts/update/contact_update_page.dart';
import 'package:bloc_pro/home/home_page.dart';
import 'package:bloc_pro/repositories/contact_repository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ContactRepository(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        routes: {
          '/': (_) => const HomePage(),
          '/bloc/example/': (_) => BlocProvider(
                create: (_) => ExampleBloc()..add(ExampleFindNameEvent()),
                child: const BlocExemple(),
              ),
          '/bloc/example/freezed': (context) => const BlocFreezedExample(),
          '/contacts/list': (context) => BlocProvider(
                create: (_) => ContactListBloc(
                    repository: context.read<ContactRepository>())
                  ..add(const ContactsListEvent.findAll()),
                child: const ContactsListPage(),
              ),
          'contacts/register': (context) => const ContactRegisterPage(),
          'contacts/update': (context) => const ContactUpdatePage(),
        },
      ),
    );
  }
}
