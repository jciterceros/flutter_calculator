import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/domain/entities/calculator_entity.dart';

void main() {
  group('CalculatorEntity', () {
    late CalculatorEntity calculatorEntity;

    setUp(() {
      calculatorEntity = CalculatorEntity(
        buffer: [0.0, 0.0],
        currentBufferIndex: 0,
        operation: '',
        displayValue: '0',
        wipeValue: false,
        lastCommand: '',
      );
    });

    test('Deve inicializar com valores padrão corretos', () {
      expect(calculatorEntity.buffer, [0.0, 0.0]);
      expect(calculatorEntity.currentBufferIndex, 0);
      expect(calculatorEntity.operation, '');
      expect(calculatorEntity.displayValue, '0');
      expect(calculatorEntity.wipeValue, false);
      expect(calculatorEntity.lastCommand, '');
    });

    test('copyWith deve atualizar apenas os campos fornecidos', () {
      final updatedEntity = calculatorEntity.copyWith(
        buffer: [5.0, 10.0],
        currentBufferIndex: 1,
        operation: '+',
        displayValue: '15',
        wipeValue: true,
        lastCommand: '=',
      );

      expect(updatedEntity.buffer, [5.0, 10.0]);
      expect(updatedEntity.currentBufferIndex, 1);
      expect(updatedEntity.operation, '+');
      expect(updatedEntity.displayValue, '15');
      expect(updatedEntity.wipeValue, true);
      expect(updatedEntity.lastCommand, '=');

      // Verifica que os valores originais não foram alterados
      expect(calculatorEntity.buffer, [0.0, 0.0]);
      expect(calculatorEntity.currentBufferIndex, 0);
      expect(calculatorEntity.operation, '');
      expect(calculatorEntity.displayValue, '0');
      expect(calculatorEntity.wipeValue, false);
      expect(calculatorEntity.lastCommand, '');
    });

    test('reset deve retornar a entidade ao estado inicial', () {
      final updatedEntity = calculatorEntity.copyWith(
        buffer: [5.0, 10.0],
        currentBufferIndex: 1,
        operation: '+',
        displayValue: '15',
        wipeValue: true,
        lastCommand: '=',
      );

      final resetEntity = updatedEntity.reset();

      expect(resetEntity.buffer, [0.0, 0.0]);
      expect(resetEntity.currentBufferIndex, 0);
      expect(resetEntity.operation, '');
      expect(resetEntity.displayValue, '0');
      expect(resetEntity.wipeValue, false);
      expect(resetEntity.lastCommand, '');
    });

    test(
      'updateBufferAndDisplay deve atualizar o buffer e o display corretamente',
      () {
        final updatedEntity = calculatorEntity.updateBufferAndDisplay(42.0, 0);

        expect(updatedEntity.buffer, [42.0, 0.0]);
        expect(updatedEntity.displayValue, '42.0');
        expect(updatedEntity.wipeValue, false);
      },
    );

    test('formatValue deve remover ".0" de valores inteiros', () {
      expect(calculatorEntity.formatValue(42.0), '42');
      expect(calculatorEntity.formatValue(42.5), '42.5');
    });
  });
}
