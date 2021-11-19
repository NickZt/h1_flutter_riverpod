import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/presentation/manager/bindings/counter_view_binding.dart';

class CounterIsEven extends ConsumerWidget {
  const CounterIsEven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEven = ref.watch(isEvenProvider);
    return Text(isEven ? 'Is even' : 'Not even');
  }
}

class EvenCounterFromProvider extends ConsumerWidget {
  const EvenCounterFromProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evenCount = ref.watch(evenCounterProvider);
    return Text('(StateProvider) Even Number Count: $evenCount');
  }
}

class EvenCounter extends ConsumerWidget {
  const EvenCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evenCount = ref.watch(evenCounterProviderAsSeparateState).count;
    return Text(' (StateNotifier) Even Number Count: $evenCount');
  }
}
