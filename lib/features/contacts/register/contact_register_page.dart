import 'package:flutter/material.dart';

class ContactRegisterPage extends StatefulWidget {
  const ContactRegisterPage({Key? key}) : super(key: key);

  @override
  State<ContactRegisterPage> createState() => _ContactRegisterPageState();
}

class _ContactRegisterPageState extends State<ContactRegisterPage> {
  final _formkey = GlobalKey<FormState>();

  final _name = TextEditingController();
  final _email = TextEditingController();

  @override
  void dispose() {
    _name.dispose();
    _email.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('register')),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  label: Text('Nome'),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'nome é obrigatório';
                  }

                  return null;
                },
              ),
              TextFormField(
                controller: _email,
                decoration: const InputDecoration(
                  label: Text('E-mail'),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return 'email é obrigatório';
                  }

                  return null;
                },
              ),
              ElevatedButton(
                child: const Text('Salvar'),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
