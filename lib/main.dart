import 'package:flutter/material.dart';
import 'package:flutter_calculator/domain/models/memory.dart';
import 'presentation/screens/calculator.dart';

void main() {
  runApp(
    MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: Calculator(memory: Memory()),
    ),
  );
}
