import 'package:flutter/material.dart';
import '../components/display.dart';
import '../components/keyboard.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  _onButtonPressed(String buttonText) {
    print(buttonText);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Column(
        children: <Widget>[
          Display(displayText: "123.456"),
          Keyboard(cb: _onButtonPressed),
        ],
      ),
    );
  }
}
