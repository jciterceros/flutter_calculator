import 'package:flutter/material.dart';
import 'package:flutter_calculator/presentation/widgets/button.dart';
import 'package:flutter_calculator/presentation/widgets/button_row.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ButtonRow Widget', () {
    testWidgets('Deve renderizar todos os botões fornecidos', (
      WidgetTester tester,
    ) async {
      // Arrange
      final buttons = [
        Button(buttonText: '1', cb: (_) {}),
        Button(buttonText: '2', cb: (_) {}),
        Button(buttonText: '3', cb: (_) {}),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(
              // Column é necessário para suportar o Expanded
              children: [ButtonRow(buttons)],
            ),
          ),
        ),
      );

      // Assert
      for (final button in buttons) {
        expect(find.text(button.buttonText), findsOneWidget);
      }
    });

    testWidgets('Deve aplicar o espaçamento correto entre os botões', (
      WidgetTester tester,
    ) async {
      // Arrange
      const spacing = 10.0;
      final buttons = [
        Button(buttonText: 'A', cb: (_) {}),
        Button(buttonText: 'B', cb: (_) {}),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(children: [ButtonRow(buttons, spacing: spacing)]),
          ),
        ),
      );

      // Assert
      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      for (final sizedBox in sizedBoxes) {
        expect(sizedBox.width, spacing);
      }
    });

    testWidgets('Deve renderizar sem espaçamento quando spacing é 0', (
      WidgetTester tester,
    ) async {
      // Arrange
      const spacing = 0.0;
      final buttons = [
        Button(buttonText: 'X', cb: (_) {}),
        Button(buttonText: 'Y', cb: (_) {}),
      ];

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Column(children: [ButtonRow(buttons, spacing: spacing)]),
          ),
        ),
      );

      // Assert
      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      for (final sizedBox in sizedBoxes) {
        expect(sizedBox.width, spacing);
      }
    });
  });
}
