import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class ViewStatesRenderContract {
  Widget render(state, WidgetRef ref) {
    return state.when(
      even: () => showEven(ref),
      odd: () => showOdd(ref),
    );
  }

  Widget showEven(WidgetRef ref);

  Widget showOdd(WidgetRef ref);
}
