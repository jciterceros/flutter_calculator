import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const darkGray = Color.fromRGBO(82, 82, 82, 1);
  static const defaultGray = Color.fromRGBO(112, 112, 112, 1);
  static const orangeOperator = Color.fromRGBO(250, 158, 13, 1);

  final String buttonText;
  final bool bigButton;
  final Color color;
  final void Function(String) cb;

  const Button({
    super.key,
    required this.buttonText,
    this.bigButton = false,
    this.color = defaultGray,
    required this.cb,
  });

  static const EdgeInsets buttonPadding = EdgeInsets.all(0);
  static const TextStyle buttonTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 32,
    fontWeight: FontWeight.w200,
    decoration: TextDecoration.none,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bigButton ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          padding: buttonPadding,
        ),
        onPressed: () => cb(buttonText),
        child: Text(buttonText, style: buttonTextStyle),
      ),
    );
  }
}
