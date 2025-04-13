import 'package:flutter/material.dart';
import 'package:flutter_calculator/domain/models/memory.dart';
import 'package:flutter_calculator/presentation/screens/calculator.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Deve renderizar APP usando MaterialApp com o titulo correto', (
    WidgetTester tester,
  ) async {
    // Act
    await tester.pumpWidget(
      MaterialApp(
        title: 'Flutter Calculator',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark(),
        home: Calculator(memory: Memory()),
      ),
    );

    // Assert
    expect(find.byType(MaterialApp), findsOneWidget);
  });

  testWidgets('Deve ser a tela inicial', (WidgetTester tester) async {
    // Act
    await tester.pumpWidget(MaterialApp(home: Calculator(memory: Memory())));

    // Assert
    expect(find.byType(Calculator), findsOneWidget);
  });

  testWidgets('Deve usar tema dark', (WidgetTester tester) async {
    // Act
    await tester.pumpWidget(
      MaterialApp(theme: ThemeData.dark(), home: Calculator(memory: Memory())),
    );

    // Assert
    final MaterialApp app = tester.widget(find.byType(MaterialApp));
    expect(app.theme, ThemeData.dark());
  });
}
