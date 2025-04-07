import 'package:flutter/material.dart';
import 'button.dart';

class ButtonRow extends StatelessWidget {
  final List<Button> buttons;
  final double spacing;

  const ButtonRow(this.buttons, {this.spacing = 1.0, super.key});

  @override
  Widget build(BuildContext context) {
    final effectiveSpacing = spacing > 0 ? spacing : 0.0;

    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: _buildChildren(effectiveSpacing),
      ),
    );
  }

  List<Widget> _buildChildren(double effectiveSpacing) {
    return List.generate(
      buttons.length * 2 - 1,
      (index) =>
          index.isEven
              ? buttons[index ~/ 2]
              : SizedBox(width: effectiveSpacing),
    );
  }
}
