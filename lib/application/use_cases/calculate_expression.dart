import 'package:flutter_calculator/infrastructure/repositories/calculator_repository_impl.dart';

class CalculateExpression {
  final CalculatorRepositoryImpl _repository;

  CalculateExpression(this._repository);

  String execute(String expression) {
    return _repository.calculate(expression);
  }
}
