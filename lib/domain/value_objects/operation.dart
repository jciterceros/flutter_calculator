class Operation {
  static const validOperations = ['+', '-', 'x', '/', 'mod', '='];

  final String value;

  Operation(this.value) {
    if (!isValid()) {
      throw ArgumentError('Invalid operation: $value');
    }
  }

  bool isArithmeticOperation() {
    return ['+', '-', 'x', '/'].contains(value);
  }

  bool isValid() {
    return validOperations.contains(value);
  }

  bool isEqualOperation() {
    return value == '=';
  }

  @override
  String toString() => value;

  @override
  bool operator ==(Object other) =>
      identical(this, other) || (other is Operation && other.value == value);

  @override
  int get hashCode => value.hashCode;
}
