import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String handler; //Question text
  Questions(this.handler);  //Class constructor
  @override
  Widget build(BuildContext context) {
    return Text(
      handler,
      style: TextStyle( //Question text styling
        color: Colors.black,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }
}
