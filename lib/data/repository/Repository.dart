import 'package:h1_flutter_riverpod/data/models/counter_model.dart';
import 'package:h1_flutter_riverpod/domain/usecase/UseCase.dart';

class Repository implements UseCase {
  CounterModel _counter = CounterModel(0);
  CounterModel _evenCounter = CounterModel(0);

  void iniLoad() {}

  void incrementEvenCounter() {
    _evenCounter = CounterModel(_evenCounter.count + 1);
  }

  @override
  bool isEven() {
    return (_counter.count % 2 == 0);
  }

  @override
  CounterModel getCounter() {
    return _counter;
  }

  @override
  void increment() {
    _counter = CounterModel(_counter.count + 1);
  }

  @override
  CounterModel getEvenCounter() {
    return _evenCounter;
  }
}
