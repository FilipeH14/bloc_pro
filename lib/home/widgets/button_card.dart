import 'package:flutter/material.dart';

class ButtonCard extends StatelessWidget {
  final String title;
  final VoidCallback action;

  const ButtonCard({
    required this.title,
    required this.action,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: SizedBox(
        height: 170,
        width: 170,
        child: Card(
          child: Center(
            child: Text(title),
          ),
        ),
      ),
    );
  }
}
