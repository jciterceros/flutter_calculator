import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_calculator/domain/interfaces/i_memory.dart';

class MockMemory implements IMemory {
  @override
  void applyCommand(String command) {}

  @override
  String get value => 'mock';
}

void main() {
  group('IMemory Interface', () {
    test('MockMemory deve implementar applyCommand', () {
      final memory = MockMemory();
      expect(
        memory.applyCommand != null,
        isTrue,
        reason: 'applyCommand deve ser um método',
      );
    });

    test('MockMemory deve implementar value', () {
      final memory = MockMemory();
      expect(memory.value, isNotNull, reason: 'value deve ser um getter');
    });
  });
}
