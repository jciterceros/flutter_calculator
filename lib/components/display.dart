import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class Display extends StatelessWidget {
  final String displayText;

  const Display({super.key, this.displayText = "0"});

  static const _backgroundColor = Color.fromRGBO(48, 48, 48, 1);
  static const _padding = EdgeInsets.all(8.0);
  static const double _minFontSize = 20.0;
  static const double _maxFontSize = 80.0;
  static const int _maxLines = 1;

  static TextStyle _getTextStyle() {
    return const TextStyle(
      fontWeight: FontWeight.w100,
      decoration: TextDecoration.none,
      fontSize: 80,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: _backgroundColor,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Padding(
              padding: _padding,
              child: AutoSizeText(
                displayText.isNotEmpty ? displayText : "0",
                minFontSize: _minFontSize,
                maxFontSize: _maxFontSize,
                maxLines: _maxLines,
                textAlign: TextAlign.end,
                style: _getTextStyle(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
