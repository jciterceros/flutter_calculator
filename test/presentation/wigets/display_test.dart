import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_calculator/presentation/widgets/display.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Display Widget', () {
    testWidgets(
      'Deve renderizar o texto padrão "0" quando nenhum texto é fornecido',
      (WidgetTester tester) async {
        // Act
        await tester.pumpWidget(
          const MaterialApp(
            home: Scaffold(
              body: Column(
                // Column é necessário para suportar o Expanded
                children: [Display()],
              ),
            ),
          ),
        );

        // Assert
        expect(find.text("0"), findsOneWidget);
      },
    );

    testWidgets('Deve renderizar o texto fornecido corretamente', (
      WidgetTester tester,
    ) async {
      // Arrange
      const displayText = "12345";

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(children: [Display(displayText: displayText)]),
          ),
        ),
      );

      // Assert
      expect(find.text(displayText), findsOneWidget);
    });

    testWidgets('Deve aplicar o estilo correto ao texto', (
      WidgetTester tester,
    ) async {
      // Arrange
      const displayText = "67890";

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(children: [Display(displayText: displayText)]),
          ),
        ),
      );

      // Assert
      final textWidget = tester.widget<AutoSizeText>(find.byType(AutoSizeText));
      expect(
        textWidget.style,
        const TextStyle(
          fontWeight: FontWeight.w100,
          decoration: TextDecoration.none,
          fontSize: 80,
          color: Colors.white,
        ),
      );
    });

    testWidgets('Deve aplicar o background correto ao container', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: Column(children: [Display()]))),
      );

      // Assert
      final container = tester.widget<Container>(find.byType(Container));
      expect(container.color, const Color.fromRGBO(48, 48, 48, 1));
    });

    testWidgets('Deve aplicar o padding correto ao texto', (
      WidgetTester tester,
    ) async {
      // Act
      await tester.pumpWidget(
        const MaterialApp(home: Scaffold(body: Column(children: [Display()]))),
      );

      // Assert
      final padding = tester.widget<Padding>(find.byType(Padding));
      expect(padding.padding, const EdgeInsets.all(8.0));
    });

    testWidgets('Deve respeitar os limites de fonte e linhas', (
      WidgetTester tester,
    ) async {
      // Arrange
      const displayText = "1234567890";

      // Act
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Column(children: [Display(displayText: displayText)]),
          ),
        ),
      );

      // Assert
      final textWidget = tester.widget<AutoSizeText>(find.byType(AutoSizeText));
      expect(textWidget.minFontSize, 20.0);
      expect(textWidget.maxFontSize, 80.0);
      expect(textWidget.maxLines, 1);
    });
  });
}
