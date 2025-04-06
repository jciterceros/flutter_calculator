class Memory {
  static const operations = ['mod', '/', 'x', '-', '+', '='];
  final _buffer = [0.0, 0.0];
  int _currentBufferIndex = 0;
  String _operation = '';
  String _value = "0";
  bool _wipeValue = false;
  final String _lastCommand = '';

  void applyCommand(String command) {
    if (_isReplacingOperation(command)) {
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
  }

  _isReplacingOperation(String command) {
    return operations.contains(_lastCommand) &&
        operations.contains(command) &&
        _lastCommand != '=' &&
        command != '=';
  }

  _setOperation(String operation) {
    bool isEqual = operation == '=';
    if (_currentBufferIndex == 0) {
      if (!isEqual) {
        _operation = operation;
        _currentBufferIndex = 1;
        _wipeValue = true;
      }
    } else {
      _buffer[0] = _calculate();
      _buffer[1] = 0.0;
      _value = _buffer[0].toString();
      _value = _value.endsWith('.0') ? _value.split('.')[0] : _value;

      _operation = isEqual ? '' : operation;
      _currentBufferIndex = isEqual ? 0 : 1;
    }
    _wipeValue = true;
  }

  _addDigit(String digit) {
    final isDot = digit == '.';
    final wipeValue = (_value == '0' && !isDot) || _wipeValue;

    if (isDot && _value.contains('.') && !wipeValue) {
      return; // Ignore if dot is already present and not wiping value
    }

    final emptyValue = isDot ? "0" : "";
    final currentValue = wipeValue ? emptyValue : _value;
    _value = currentValue + digit;
    _wipeValue = false;

    _buffer[_currentBufferIndex] = double.tryParse(_value) ?? 0.0;
  }

  _calculate() {
    switch (_operation) {
      case 'mod':
        return _buffer[0] % _buffer[1];
      case '/':
        return _buffer[0] / _buffer[1];
      case 'x':
        return _buffer[0] * _buffer[1];
      case '-':
        return _buffer[0] - _buffer[1];
      case '+':
        return _buffer[0] + _buffer[1];
      default:
        return _buffer[0];
    }
  }

  _allClear() {
    _value = "0";
    _buffer[0] = 0.0;
    _buffer[1] = 0.0;
  }

  String get value => _value;
}
