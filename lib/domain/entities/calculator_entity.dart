class CalculatorEntity {
  final List<double> buffer;
  final int currentBufferIndex;
  final String operation;
  final String displayValue;
  final bool wipeValue;
  final String lastCommand;

  CalculatorEntity({
    required this.buffer,
    required this.currentBufferIndex,
    required this.operation,
    required this.displayValue,
    required this.wipeValue,
    required this.lastCommand,
  });

  CalculatorEntity copyWith({
    List<double>? buffer,
    int? currentBufferIndex,
    String? operation,
    String? displayValue,
    bool? wipeValue,
    String? lastCommand,
  }) {
    return CalculatorEntity(
      buffer: buffer ?? this.buffer,
      currentBufferIndex: currentBufferIndex ?? this.currentBufferIndex,
      operation: operation ?? this.operation,
      displayValue: displayValue ?? this.displayValue,
      wipeValue: wipeValue ?? this.wipeValue,
      lastCommand: lastCommand ?? this.lastCommand,
    );
  }

  /// Reseta o estado da calculadora.
  CalculatorEntity reset() {
    return CalculatorEntity(
      buffer: [0.0, 0.0],
      currentBufferIndex: 0,
      operation: '',
      displayValue: '0',
      wipeValue: false,
      lastCommand: '',
    );
  }

  /// Atualiza o buffer e o display com base no valor fornecido.
  CalculatorEntity updateBufferAndDisplay(double value, int bufferIndex) {
    final updatedBuffer = List<double>.from(buffer);
    updatedBuffer[bufferIndex] = value;

    return copyWith(
      buffer: updatedBuffer,
      displayValue: value.toString(),
      wipeValue: false,
    );
  }

  /// Formata o valor para exibição.
  String formatValue(double value) {
    final stringValue = value.toString();
    return stringValue.endsWith('.0') ? stringValue.split('.')[0] : stringValue;
  }
}
