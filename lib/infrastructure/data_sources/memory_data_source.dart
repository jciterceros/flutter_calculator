import '../../domain/models/memory.dart';

class MemoryDataSource {
  final Memory _memory = Memory();

  /// Aplica um comando à memória e retorna o valor atualizado.
  String applyCommand(String command) {
    _memory.applyCommand(command);
    return _memory.value;
  }
}
