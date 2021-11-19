import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/presentation/manager/bindings/counter_view_binding.dart';
import 'package:h1_flutter_riverpod/presentation/widgets/counter_widget.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(viewStateProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Provider Page'),
      ),
      body: render(state, ref),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          onFabPressed(ref);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Widget render(state, WidgetRef ref ) {
    return state.when(
      even: () =>
          showEven(ref),
      odd: () =>
          showOdd(ref),
    );
  }

  Widget showEven(WidgetRef ref) {
    final counter = buildCount(ref);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Count: $counter'),
          CounterIsEven(),
          EvenCounter(),
          EvenCounterFromProvider(),
        ],
      ),
    );
  }

  Widget showOdd(WidgetRef ref) {
    final counter = buildCount(ref);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CounterIsEven(),
          EvenCounter(),
          EvenCounterFromProvider(),
          Text('Count: $counter'),
        ],
      ),
    );
  }

  buildCount(WidgetRef ref) =>
      ref
          .watch(counterProvider)
          .count;

  void onFabPressed(WidgetRef ref) {
    ref.read(counterProvider.notifier).increment();
    final isEven = ref.watch(isEvenProvider);
    if (isEven)
      ref.read(evenCounterProviderAsSeparateState.notifier).increment();
  }
}
