import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/data/models/counter_model.dart';
import 'package:h1_flutter_riverpod/data/repository/Repository.dart';
import 'package:h1_flutter_riverpod/domain/usecase/UseCase.dart';

import 'model/view_state.dart';

final viewModelProvider = ChangeNotifierProvider((ref) => ViewModel());

class ViewModel extends ChangeNotifier {
  ViewModel() {
    _useCase.iniLoad();
  }

  final UseCase _useCase = Repository();

  CounterModel get counter => _useCase.getCounter();

  void _increment() {
    _useCase.increment();
  }

  bool isEven() {
    return _useCase.isEven();
  }

  ViewState _state = ViewState.odd();

  ViewState get state => _state;

  void _resetState() {
    _state = ViewState.odd();
    notifyListeners();
  }

  void _setState(ViewState viewsState) => _state = viewsState;


  CounterModel get evenCounter => _useCase.getEvenCounter();

  void _incrementEvenCounter() {
    _useCase.incrementEvenCounter();
  }

  void onFabPressed() {
    _increment();
    if (isEven()) {
      setEvenState();
    } else
      _resetState();
  }


  void setEvenState() {
    _incrementEvenCounter();
    _setState(ViewState.even());
    notifyListeners();
  }
}
