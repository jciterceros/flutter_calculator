import 'package:flutter/material.dart';
import 'button.dart';
import 'button_row.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) cb;

  const Keyboard({super.key, required this.cb});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      child: Column(
        children: <Widget>[
          ButtonRow([
            Button(
              buttonText: "AC",
              bigButton: true,
              color: Button.DARK,
              cb: cb,
            ),
            Button(buttonText: "mod", color: Button.DARK, cb: cb),
            Button(buttonText: "/", color: Button.OPERATORS, cb: cb),
          ]),
          ButtonRow([
            Button(buttonText: "7", cb: cb),
            Button(buttonText: "8", cb: cb),
            Button(buttonText: "9", cb: cb),
            Button(buttonText: "x", color: Button.OPERATORS, cb: cb),
          ]),
          ButtonRow([
            Button(buttonText: "4", cb: cb),
            Button(buttonText: "5", cb: cb),
            Button(buttonText: "6", cb: cb),
            Button(buttonText: "-", color: Button.OPERATORS, cb: cb),
          ]),
          ButtonRow([
            Button(buttonText: "1", cb: cb),
            Button(buttonText: "2", cb: cb),
            Button(buttonText: "3", cb: cb),
            Button(buttonText: "+", color: Button.OPERATORS, cb: cb),
          ]),
          ButtonRow([
            Button(buttonText: "0", bigButton: true, cb: cb),
            Button(buttonText: ".", cb: cb),
            Button(buttonText: "=", color: Button.OPERATORS, cb: cb),
          ]),
        ],
      ),
    );
  }
}
