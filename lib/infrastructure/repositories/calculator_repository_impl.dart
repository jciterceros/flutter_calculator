import '../../domain/repositories/calculator_repository.dart';
import '../data_sources/memory_data_source.dart';

class CalculatorRepositoryImpl implements CalculatorRepository {
  final MemoryDataSource _memoryDataSource;

  CalculatorRepositoryImpl(this._memoryDataSource);

  @override
  String calculate(String expression) {
    return _memoryDataSource.applyCommand(expression);
  }
}
