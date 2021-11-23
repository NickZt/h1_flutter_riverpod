import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/data/models/counter_model.dart';

import 'model/view_state.dart';

final viewModelProvider = ChangeNotifierProvider((ref) => ViewModel());

class ViewModel extends ChangeNotifier {
  ViewModel();

  CounterModel _counter = CounterModel(0);

  CounterModel get counter => _counter;

  void increment() {
    _counter = CounterModel(_counter.count + 1);
  }

  bool isEven() {
    return (_counter.count % 2 == 0);
  }

  ViewState _state = ViewState.odd();

  ViewState get state => _state;

  void resetState() {
    _state = ViewState.odd();
    notifyListeners();
  }

  void setState(ViewState viewsState) => _state = viewsState;

  CounterModel _evenCounter = CounterModel(0);

  CounterModel get evenCounter => _evenCounter;

  void incrementEvenCounter() {
    _evenCounter = CounterModel(_evenCounter.count + 1);
  }

  void onFabPressed() {
    increment();
    if (isEven()) {
      setEvenState();
    } else
      resetState();
  }


  void setEvenState() {
    incrementEvenCounter();
    setState(ViewState.even());
    notifyListeners();
  }
}
