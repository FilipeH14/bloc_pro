import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class Loader<B extends StateStreamable<S>, S> extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(),
    );
  }
}
