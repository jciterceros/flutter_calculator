import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/domain/value_objects/operation.dart';

void main() {
  group('Operation', () {
    test('Deve criar uma operação válida', () {
      const validOperation = '+';

      final operation = Operation(validOperation);

      expect(operation.value, validOperation);
    });

    test('Deve lançar ArgumentError para uma operação inválida', () {
      const invalidOperation = '%';

      expect(() => Operation(invalidOperation), throwsArgumentError);
    });

    test('Deve identificar operações aritméticas corretamente', () {
      const arithmeticOperations = ['+', '-', 'x', '/'];

      for (final op in arithmeticOperations) {
        final operation = Operation(op);

        expect(operation.isArithmeticOperation(), isTrue);
      }
    });

    test('Deve retornar falso para operações não aritméticas', () {
      const nonArithmeticOperations = ['mod', '='];

      for (final op in nonArithmeticOperations) {
        final operation = Operation(op);

        expect(operation.isArithmeticOperation(), isFalse);
      }
    });

    test('Deve validar operações corretamente', () {
      const validOperations = ['+', '-', 'x', '/', 'mod', '='];

      for (final op in validOperations) {
        final operation = Operation(op);

        expect(operation.isValid(), isTrue);
      }
    });

    test('Deve retornar falso para operações inválidas', () {
      const invalidOperations = ['%', '!', 'abc'];

      for (final op in invalidOperations) {
        expect(() => Operation(op), throwsArgumentError);
      }
    });

    test('Deve identificar a operação de igualdade corretamente', () {
      const equalOperation = '=';

      final operation = Operation(equalOperation);

      expect(operation.isEqualOperation(), isTrue);
    });

    test('Deve retornar falso para operações que não são de igualdade', () {
      const nonEqualOperations = ['+', '-', 'x', '/', 'mod'];

      for (final op in nonEqualOperations) {
        final operation = Operation(op);

        expect(operation.isEqualOperation(), isFalse);
      }
    });

    test('Deve sobrescrever o método toString corretamente', () {
      const operationValue = '+';

      final operation = Operation(operationValue);

      expect(operation.toString(), operationValue);
    });

    test('Deve comparar igualdade corretamente com o operador ==', () {
      const operationValue = '+';

      final operation1 = Operation(operationValue);
      final operation2 = Operation(operationValue);

      expect(operation1 == operation2, isTrue);
    });

    test('Deve gerar o mesmo hashCode para operações iguais', () {
      const operationValue = '+';

      final operation1 = Operation(operationValue);
      final operation2 = Operation(operationValue);

      expect(operation1.hashCode, operation2.hashCode);
    });

    test('Deve gerar hashCodes diferentes para operações diferentes', () {
      final operation1 = Operation('+');
      final operation2 = Operation('-');

      expect(operation1.hashCode, isNot(operation2.hashCode));
    });
  });
}
