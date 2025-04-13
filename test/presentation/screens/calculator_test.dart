import 'package:flutter/material.dart';
import 'package:flutter_calculator/domain/interfaces/i_memory.dart';
import 'package:flutter_calculator/presentation/screens/calculator.dart';
import 'package:flutter_calculator/presentation/widgets/display.dart';
import 'package:flutter_calculator/presentation/widgets/keyboard.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:logger/logger.dart';

class MockMemory implements IMemory {
  String _value = '0';

  @override
  void applyCommand(String command) {
    if (command == 'ERROR') {
      throw Exception('Simulated error');
    } else if (command == 'AC') {
      _value = '0';
    } else {
      _value += command;
    }
  }

  @override
  String get value => _value;
}

class MockLogger extends Mock implements Logger {}

void main() {
  group('Calculator Widget', () {
    late MockMemory mockMemory;

    setUp(() {
      mockMemory = MockMemory();
    });

    testWidgets('Deve renderizar Display e Keyboard', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Calculator(memory: mockMemory)),
      );

      expect(find.byType(Display), findsOneWidget);
      expect(find.byType(Keyboard), findsOneWidget);
    });

    testWidgets('Deve exibir o valor inicial no Display', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Calculator(memory: mockMemory)),
      );

      // Localiza o widget Display
      final displayFinder = find.byType(Display);

      // Verifica se o Display contém o texto "0"
      expect(
        find.descendant(of: displayFinder, matching: find.text('0')),
        findsOneWidget,
      );
    });

    testWidgets('Deve atualizar o Display ao pressionar um botão', (
      WidgetTester tester,
    ) async {
      await tester.pumpWidget(
        MaterialApp(home: Calculator(memory: mockMemory)),
      );

      await tester.tap(find.text('1'));
      await tester.pump();

      expect(find.text('01'), findsOneWidget);
    });

    testWidgets('Deve limpar o Display ao pressionar o botão AC', (
      WidgetTester tester,
    ) async {
      // Arrange
      await tester.pumpWidget(
        MaterialApp(home: Calculator(memory: mockMemory)),
      );

      // Act
      await tester.tap(find.text('1'));
      await tester.pump();
      await tester.tap(find.text('AC'));
      await tester.pump();

      // Assert
      final displayFinder = find.byType(Display); // Localiza o widget Display
      expect(displayFinder, findsOneWidget); // Garante que o Display existe
      expect(
        find.descendant(
          of: displayFinder,
          matching: find.text('0'),
        ), // Verifica o texto "0" dentro do Display
        findsOneWidget,
      );
    });
  });
}
