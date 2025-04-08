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

    test('Deve lidar com divisão por zero', () {
      memory.applyCommand('5');
      memory.applyCommand('/');
      memory.applyCommand('0');
      memory.applyCommand('=');

      expect(memory.value, 'Infinity');
    });
  });
}
