class Memory {
  static const operations = ['mod', '/', 'x', '-', '+', '='];
  final _buffer = [0.0, 0.0];
  int _currentBufferIndex = 0;
  String _operation = '';
  String _value = "0";
  bool _wipeValue = false;
  String _lastCommand = '';

  void applyCommand(String command) {
    if (_shouldReplaceOperation(command)) {
      _operation = command;
      return;
    }

    if (command == 'AC') {
      _allClear();
    } else if (operations.contains(command)) {
      _setOperation(command);
    } else {
      _addDigit(command);
    }

    _lastCommand = command;
  }

  _shouldReplaceOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  _setOperation(String operation) {
    final isEqual = operation == '=';
    if (_currentBufferIndex == 0) {
      if (!isEqual) {
        _operation = operation;
        _currentBufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;

      _value = _formatValue(_buffer[0]);

      _operation = isEqual ? '' : operation;
      _currentBufferIndex = isEqual ? 0 : 1;
    }
    _wipeValue = true;
  }

  _addDigit(String digit) {
    const dot = '.';
    final isDot = digit == dot;
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    if (isDot && _value.contains(dot) && !wipeValue) {
      return; // Ignore if dot is already present and not wiping value
    }

    final emptyValue = isDot ? "0" : "";
    final currentValue = wipeValue ? emptyValue : _value;

    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_currentBufferIndex] = double.tryParse(_value) ?? 0.0;
  }

  double _calculate() {
    switch (_operation) {
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
        return _buffer[0];
    }
  }

  double _modulo() => _buffer[1] == 0 ? 0 : _buffer[0] % _buffer[1];
  double _divide() =>
      _buffer[1] == 0 ? double.infinity : _buffer[0] / _buffer[1];
  double _multiply() => _buffer[0] * _buffer[1];
  double _subtract() => _buffer[0] - _buffer[1];
  double _add() => _buffer[0] + _buffer[1];

  _allClear() {
    _value = "0";
    _buffer[0] = 0.0;
    _buffer[1] = 0.0;
    _operation = '';
    _currentBufferIndex = 0;
    _wipeValue = false;
    _lastCommand = '';
  }

  String _formatValue(double value) {
    final stringValue = value.toString();
    return stringValue.endsWith('.0') ? stringValue.split('.')[0] : stringValue;
  }

  String get value => _value;
}
