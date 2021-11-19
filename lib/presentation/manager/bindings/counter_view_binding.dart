import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/data/models/counter_model.dart';
import 'package:h1_flutter_riverpod/presentation/manager/bindings/counter_notifier.dart';
import 'package:h1_flutter_riverpod/presentation/manager/bindings/even_counter_notifier.dart';

final isEvenProvider = Provider.autoDispose<bool>((ref) {
  final counter = ref.watch(counterProvider);
  return (counter.count % 2 == 0);
});

// StateNotifier and even numbers counter in a separate class
final evenCounterProviderAsSeparateState =
    StateNotifierProvider.autoDispose<EvenCounterNotifier, EvenCounterModel>(
        (ref) {
  return EvenCounterNotifier();
});

//  StateProvider and even numbers counter in a state provider
final evenCounterProvider = Provider.autoDispose<int>((ref) {
  ref.listen<bool>(isEvenProvider, (previous, next) {
    if (next) {
      ref.state++;
    }
  });
  return 0;
});

final counterProvider =
    StateNotifierProvider.autoDispose<CounterNotifier, CounterModel>((ref) {
  return CounterNotifier();
});
