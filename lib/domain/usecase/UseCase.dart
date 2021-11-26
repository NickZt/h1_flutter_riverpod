import 'package:h1_flutter_riverpod/data/models/counter_model.dart';

abstract class UseCase {
  void iniLoad();

  void incrementEvenCounter();

  bool isEven() {
    return (getCounter().count % 2 == 0);
  }

  CounterModel getCounter();

  CounterModel getEvenCounter();

  void increment();
}
