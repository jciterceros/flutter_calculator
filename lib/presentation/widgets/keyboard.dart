import 'package:flutter/material.dart';
import 'button.dart';
import 'button_row.dart';

class Keyboard extends StatelessWidget {
  final void Function(String) cb;

  const Keyboard({super.key, required this.cb});

  static const double _keyboardHeight = 500;
  static const double _buttonSpacing = 1;
  static double get buttonSpacing => _buttonSpacing;

  Button _buildButton({
    required String text,
    bool bigButton = false,
    Color? color,
  }) {
    return Button(
      buttonText: text,
      bigButton: bigButton,
      color: color ?? Button.defaultGray,
      cb: cb,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: _keyboardHeight,
      child: Column(
        children: <Widget>[
          ButtonRow([
            _buildButton(text: "AC", bigButton: true, color: Button.darkGray),
            _buildButton(text: "mod", color: Button.darkGray),
            _buildButton(text: "/", color: Button.orangeOperator),
          ]),
          const SizedBox(height: _buttonSpacing),
          ButtonRow([
            _buildButton(text: "7"),
            _buildButton(text: "8"),
            _buildButton(text: "9"),
            _buildButton(text: "x", color: Button.orangeOperator),
          ]),
          const SizedBox(height: _buttonSpacing),
          ButtonRow([
            _buildButton(text: "4"),
            _buildButton(text: "5"),
            _buildButton(text: "6"),
            _buildButton(text: "-", color: Button.orangeOperator),
          ]),
          const SizedBox(height: _buttonSpacing),
          ButtonRow([
            _buildButton(text: "1"),
            _buildButton(text: "2"),
            _buildButton(text: "3"),
            _buildButton(text: "+", color: Button.orangeOperator),
          ]),
          const SizedBox(height: _buttonSpacing),
          ButtonRow([
            _buildButton(text: "0", bigButton: true),
            _buildButton(text: "."),
            _buildButton(text: "=", color: Button.orangeOperator),
          ]),
        ],
      ),
    );
  }
}
