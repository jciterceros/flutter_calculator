import 'package:flutter_calculator/domain/repositories/calculator_repository.dart';
import 'package:flutter_test/flutter_test.dart';

// Implementação concreta para teste
class SimpleCalculatorRepository implements CalculatorRepository {
  @override
  String calculate(String expression) {
    // Implementação simples para simular o cálculo
    if (expression == '2+2') {
      return '4';
    } else if (expression == '5-3') {
      return '2';
    } else if (expression.isEmpty) {
      return '';
    } else {
      throw Exception('Expressão inválida');
    }
  }
}

void main() {
  late CalculatorRepository repository;

  setUp(() {
    repository = SimpleCalculatorRepository();
  });

  group('CalculatorRepository', () {
    test('Deve calcular corretamente uma expressão válida', () {
      const expression = '2+2';
      const expectedResult = '4';

      final result = repository.calculate(expression);

      expect(result, expectedResult);
    });

    test('Deve retornar uma string vazia para uma expressão vazia', () {
      const expression = '';
      const expectedResult = '';

      final result = repository.calculate(expression);

      expect(result, expectedResult);
    });

    test('Deve lançar uma exceção para uma expressão inválida', () {
      const expression = 'invalid';

      expect(() => repository.calculate(expression), throwsA(isA<Exception>()));
    });
  });
}
