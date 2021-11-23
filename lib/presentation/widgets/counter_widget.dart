import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/presentation/manager/counter_view_model.dart';

class CounterIsEven extends ConsumerWidget {
  const CounterIsEven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEven =
        ref.watch(viewModelProvider.select((value) => value.isEven()));
    return Text(isEven ? 'Is even' : 'Not even');
  }
}



class EvenCounter extends ConsumerWidget {
  const EvenCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evenCount = ref.watch(
        viewModelProvider.select((value) => value.evenCounter.count));
    return Text('  Even Number Count: $evenCount');
  }
}
