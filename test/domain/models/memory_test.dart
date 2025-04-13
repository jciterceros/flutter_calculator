import 'package:flutter_calculator/domain/entities/calculator_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/domain/models/memory.dart';

void main() {
  group('Memory', () {
    late Memory memory;

    setUp(() {
      memory = Memory();
    });

    test('Deve somar dois números corretamente', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('=');

      expect(memory.value, '8');
    });

    test('Deve subtrair dois números corretamente', () {
      memory.applyCommand('10');
      memory.applyCommand('-');
      memory.applyCommand('4');
      memory.applyCommand('=');

      expect(memory.value, '6');
    });

    test('Deve multiplicar dois números corretamente', () {
      memory.applyCommand('6');
      memory.applyCommand('x');
      memory.applyCommand('7');
      memory.applyCommand('=');

      expect(memory.value, '42');
    });

    test('Deve dividir dois números corretamente', () {
      memory.applyCommand('20');
      memory.applyCommand('/');
      memory.applyCommand('4');
      memory.applyCommand('=');

      expect(memory.value, '5');
    });

    test('Deve lidar com divisão por zero', () {
      memory.applyCommand('5');
      memory.applyCommand('/');
      memory.applyCommand('0');
      memory.applyCommand('=');

      expect(memory.value, 'Infinity');
    });

    test('Deve calcular o módulo corretamente', () {
      memory.applyCommand('10');
      memory.applyCommand('mod');
      memory.applyCommand('3');
      memory.applyCommand('=');

      expect(memory.value, '1');
    });

    test('Deve limpar a memória com o comando AC', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('AC');

      expect(memory.value, '0');
    });

    test('Deve adicionar números com ponto decimal corretamente', () {
      memory.applyCommand('3');
      memory.applyCommand('.');
      memory.applyCommand('14');
      memory.applyCommand('+');
      memory.applyCommand('2');
      memory.applyCommand('.');
      memory.applyCommand('86');
      memory.applyCommand('=');

      expect(memory.value, '6');
    });

    test('Deve substituir a operação se um novo operador for inserido', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('-');
      memory.applyCommand('3');
      memory.applyCommand('=');

      expect(memory.value, '2');
    });

    test('Deve lidar com múltiplos dígitos corretamente', () {
      memory.applyCommand('12');
      memory.applyCommand('+');
      memory.applyCommand('34');
      memory.applyCommand('=');

      expect(memory.value, '46');
    });

    test('Deve lidar com múltiplas operações sequenciais', () {
      memory.applyCommand('5');
      memory.applyCommand('+');
      memory.applyCommand('3');
      memory.applyCommand('=');
      memory.applyCommand('x');
      memory.applyCommand('2');
      memory.applyCommand('=');

      expect(memory.value, '16');
    });

    test('Deve iniciar com valor 0', () {
      expect(memory.value, '0');
    });

    test(
      'Deve retornar o valor do buffer[0] quando o comando é desconhecido',
      () {
        memory.applyCommand('10');
        memory.applyCommand('desconhecido');

        expect(memory.value, '10desconhecido');
      },
    );
  });
}
