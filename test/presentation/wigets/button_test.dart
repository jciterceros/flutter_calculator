import 'package:flutter/material.dart';
import 'package:flutter_calculator/presentation/widgets/button.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Button Widget', () {
    testWidgets('Deve renderizar o texto do botão corretamente', (
      WidgetTester tester,
    ) async {
      // Arrange
      const buttonText = '1';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              // Row é necessário para suportar o Expanded
              children: [Button(buttonText: buttonText, cb: (_) {})],
            ),
          ),
        ),
      );

      // Assert
      expect(find.text(buttonText), findsOneWidget);
    });

    testWidgets('Deve chamar a função callback ao pressionar o botão', (
      WidgetTester tester,
    ) async {
      // Arrange
      var callbackCalled = false;
      const buttonText = '2';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                Button(
                  buttonText: buttonText,
                  cb: (text) {
                    callbackCalled = true;
                    expect(
                      text,
                      buttonText,
                    ); // Verifica se o texto passado é o correto
                  },
                ),
              ],
            ),
          ),
        ),
      );

      // Simula o clique no botão
      await tester.tap(find.text(buttonText));
      await tester.pumpAndSettle();

      // Assert
      expect(callbackCalled, isTrue);
    });

    testWidgets('Deve aplicar o estilo correto ao botão', (
      WidgetTester tester,
    ) async {
      // Arrange
      const buttonText = '3';

      // Act
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Row(
              children: [
                Button(
                  buttonText: buttonText,
                  color: Button.orangeOperator,
                  bigButton: true,
                  cb: (_) {},
                ),
              ],
            ),
          ),
        ),
      );

      // Assert
      final button = tester.widget<ElevatedButton>(find.byType(ElevatedButton));
      expect(button.style?.backgroundColor?.resolve({}), Button.orangeOperator);
    });
  });
}
