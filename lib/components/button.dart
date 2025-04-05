import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  static const DARK = Color.fromRGBO(82, 82, 82, 1);
  static const DEFAULT = Color.fromRGBO(112, 112, 112, 1);
  static const OPERATORS = Color.fromRGBO(250, 158, 13, 1);
  final String buttonText;
  final bool bigButton;
  final Color color;

  final void Function(String)? cb;

  const Button({
    super.key,
    required this.buttonText,
    this.bigButton = false,
    this.color = DEFAULT,
    @required this.cb,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: bigButton ? 2 : 1,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: color,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0)),
          padding: EdgeInsets.all(0),
        ),
        onPressed: () {
          if (cb != null) {
            cb!(buttonText);
          }
        },
        child: Text(
          buttonText,
          style: TextStyle(
            color: Colors.white,
            fontSize: 32,
            fontWeight: FontWeight.w200,
            decoration: TextDecoration.none,
          ),
        ),
      ),
    );
  }
}
