import 'package:flutter_riverpod/flutter_riverpod.dart';

// class to control the state, in particular to store its current value
// and increase it when the user presses the + button
class CounterNotifier extends StateNotifier<CounterModel> {
  CounterNotifier() : super(_initialValue);
  static const _initialValue = CounterModel(0);

  //An external class can call this,
  // will result in the replacement of state with a new instance of CountModel,
  // the internal count of which is one more than the last instance of CountModel
  void increment() {
    state = CounterModel(state.count + 1);
  }
}

//class to represent the state
class CounterModel {
  const CounterModel(this.count);

  //state is immutable
  final int count;
}
