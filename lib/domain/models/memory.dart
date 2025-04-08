import '../interfaces/i_memory.dart';
import '../entities/calculator_entity.dart';
import '../value_objects/operation.dart';

class Memory implements IMemory {
  static const operations = Operation.validOperations;
  CalculatorEntity _calculatorEntity = CalculatorEntity(
    buffer: [0.0, 0.0],
    currentBufferIndex: 0,
    operation: '',
    displayValue: '0',
    wipeValue: false,
    lastCommand: '',
  );

  @override
  void applyCommand(String command) {
    if (_shouldReplaceOperation(command)) {
      _calculatorEntity = _calculatorEntity.copyWith(operation: command);
      return;
    }

    if (command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(Operation(command));
    } else {
      _addDigit(command);
    }

    _calculatorEntity = _calculatorEntity.copyWith(lastCommand: command);
  }

  bool _shouldReplaceOperation(String command) {
    return operations.contains(_calculatorEntity.lastCommand) &&
        operations.contains(command) &&
        _calculatorEntity.lastCommand != '=' &&
        command != '=';
  }

  void _setOperation(Operation operation) {
    final isEqual = operation.isEqualOperation();
    if (_calculatorEntity.currentBufferIndex == 0) {
      if (!isEqual) {
        _calculatorEntity = _calculatorEntity.copyWith(
          operation: operation.value,
          currentBufferIndex: 1,
          wipeValue: true,
        );
      }
    } else {
      final result = _calculate();
      _calculatorEntity = _calculatorEntity.copyWith(
        buffer: [result, 0.0],
        displayValue: _calculatorEntity.formatValue(result),
        operation: isEqual ? '' : operation.value,
        currentBufferIndex: isEqual ? 0 : 1,
        wipeValue: true,
      );
    }
  }

  void _addDigit(String digit) {
    const dot = '.';
    final isDot = digit == dot;
    final wipeValue =
        (_calculatorEntity.displayValue == '0' && !isDot) ||
        _calculatorEntity.wipeValue;

    if (isDot && _calculatorEntity.displayValue.contains(dot) && !wipeValue) {
      return; // Ignorar se o ponto já estiver presente e não estiver limpando o valor
    }

    final emptyValue = isDot ? "0" : "";
    final currentValue =
        wipeValue ? emptyValue : _calculatorEntity.displayValue;

    final newValue = currentValue + digit;

    final newBuffer = List<double>.from(_calculatorEntity.buffer);
    newBuffer[_calculatorEntity.currentBufferIndex] =
        double.tryParse(newValue) ?? 0.0;

    _calculatorEntity = _calculatorEntity.copyWith(
      displayValue: newValue,
      buffer: newBuffer,
      wipeValue: false,
    );
  }

  double _calculate() {
    switch (_calculatorEntity.operation) {
      case 'mod':
        return _modulo();
      case '/':
        return _divide();
      case 'x':
        return _multiply();
      case '-':
        return _subtract();
      case '+':
        return _add();
      default:
        return _calculatorEntity.buffer[0];
    }
  }

  double _modulo() =>
      _calculatorEntity.buffer[1] == 0
          ? 0
          : _calculatorEntity.buffer[0] % _calculatorEntity.buffer[1];
  double _divide() =>
      _calculatorEntity.buffer[1] == 0
          ? double.infinity
          : _calculatorEntity.buffer[0] / _calculatorEntity.buffer[1];
  double _multiply() =>
      _calculatorEntity.buffer[0] * _calculatorEntity.buffer[1];
  double _subtract() =>
      _calculatorEntity.buffer[0] - _calculatorEntity.buffer[1];
  double _add() => _calculatorEntity.buffer[0] + _calculatorEntity.buffer[1];

  void _allClear() {
    _calculatorEntity = _calculatorEntity.reset();
  }

  @override
  String get value => _calculatorEntity.displayValue;
}
