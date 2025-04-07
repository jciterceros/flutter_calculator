import '../../domain/repositories/calculator_repository.dart';

class CalculateExpression {
  final CalculatorRepository _repository;

  CalculateExpression(this._repository);

  String execute(String expression) {
    return _repository.calculate(expression);
  }
}
