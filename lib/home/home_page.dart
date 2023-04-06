import 'package:bloc_pro/home/widgets/button_card.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home Page')),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Wrap(
            children: [
              ButtonCard(
                title: 'Exampe',
                action: () => Navigator.of(context).pushNamed('/bloc/example/'),
              ),
              ButtonCard(
                title: 'Exampe Freezed',
                action: () => Navigator.of(context).pushNamed('/bloc/example/freezed'),
              ),
              ButtonCard(
                title: 'Contact',
                action: () => Navigator.of(context).pushNamed('/contacts/list'),
              ),
              ButtonCard(
                title: 'Contac Cubit',
                action: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
