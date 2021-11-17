import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class EvenCounterChangeNotifier extends ChangeNotifier {
  EvenCounterChangeNotifier([this.count = 0]);

  int count;

  void increment() {
    count++;
    notifyListeners();
  }
}

// class to control the state, in particular to store its current value
// and increase it when the user presses the + button
class EvenCounterNotifier extends StateNotifier<EvenCounterModel> {
  EvenCounterNotifier() : super(_initialValue);
  static const _initialValue = EvenCounterModel(0);

  //An external class can call this,
  // will result in the replacement of state with a new instance of CountModel,
  // the internal count of which is one more than the last instance of CountModel
  void increment() {
    state = EvenCounterModel(state.count + 1);
  }
}

//class to represent the state
class EvenCounterModel {
  const EvenCounterModel(this.count);

  //state is immutable
  final int count;
}
