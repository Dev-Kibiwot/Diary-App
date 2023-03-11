import 'package:flutter/material.dart';

class MyButtons extends StatelessWidget {
  String name;
  VoidCallback onpressed;
 MyButtons({super.key, required this.name,required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Theme.of(context).primaryColor,
      onPressed:onpressed, 
      child: Text (name),
    );
  }
}