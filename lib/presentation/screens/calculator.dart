import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calculator/domain/interfaces/i_memory.dart';

import '../widgets/display.dart';
import '../widgets/keyboard.dart';

class Calculator extends StatefulWidget {
  final IMemory memory;

  const Calculator({super.key, required this.memory});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  late final IMemory memory;

  @override
  void initState() {
    super.initState();
    memory = widget.memory;
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  void _handleButtonPress(String command) {
    try {
      setState(() {
        memory.applyCommand(command);
      });
    } catch (e) {
      print('Error applying command: $command. Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Display(displayText: memory.value),
        Keyboard(cb: _handleButtonPress),
      ],
    );
  }
}
