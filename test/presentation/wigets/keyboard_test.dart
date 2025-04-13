import 'package:flutter/material.dart';
import 'package:flutter_calculator/presentation/widgets/keyboard.dart';
import 'package:flutter_calculator/presentation/widgets/button_row.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Keyboard Widget', () {
    testWidgets('Deve renderizar todas as linhas de botões corretamente', (
      WidgetTester tester,
    ) async {
      // Arrange
      void mockCallback(String value) {}

      // Act
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: Keyboard(cb: mockCallback))),
      );

      // Assert
      expect(
        find.byType(ButtonRow),
        findsNWidgets(5),
      ); // Verifica se há 5 ButtonRows
    });

    testWidgets('Deve renderizar todos os botões corretamente', (
      WidgetTester tester,
    ) async {
      // Arrange
      void mockCallback(String value) {}

      // Act
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: Keyboard(cb: mockCallback))),
      );

      // Assert
      const buttonLabels = [
        "AC",
        "mod",
        "/",
        "7",
        "8",
        "9",
        "x",
        "4",
        "5",
        "6",
        "-",
        "1",
        "2",
        "3",
        "+",
        "0",
        ".",
        "=",
      ];

      for (final label in buttonLabels) {
        expect(
          find.text(label),
          findsOneWidget,
        ); // Verifica se cada botão está presente
      }
    });

    testWidgets('Deve chamar o callback ao pressionar um botão', (
      WidgetTester tester,
    ) async {
      // Arrange
      String? pressedValue;
      void mockCallback(String value) {
        pressedValue = value;
      }

      // Act
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: Keyboard(cb: mockCallback))),
      );

      // Simula o clique no botão "5"
      await tester.tap(find.text("5"));
      await tester.pumpAndSettle();

      // Assert
      expect(pressedValue, "5");
    });

    testWidgets('Deve aplicar o espaçamento correto entre as linhas', (
      WidgetTester tester,
    ) async {
      // Arrange
      void mockCallback(String value) {}

      // Act
      await tester.pumpWidget(
        MaterialApp(home: Scaffold(body: Keyboard(cb: mockCallback))),
      );

      // Assert
      final sizedBoxes = tester.widgetList<SizedBox>(find.byType(SizedBox));
      final spacingSizedBoxes = sizedBoxes.where(
        (sizedBox) => sizedBox.height == Keyboard.buttonSpacing,
      );

      // Verifica se há espaçamentos corretos entre as linhas
      expect(
        spacingSizedBoxes.length,
        4,
      ); // Deve haver 4 espaçamentos entre as linhas
      for (final sizedBox in spacingSizedBoxes) {
        expect(sizedBox.height, Keyboard.buttonSpacing);
      }
    });
  });
}
