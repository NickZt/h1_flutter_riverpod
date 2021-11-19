import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:h1_flutter_riverpod/presentation/manager/bindings/counter_view_binding.dart';
import 'package:h1_flutter_riverpod/presentation/widgets/counter_widget.dart';

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(counterProvider).count;
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter Provider Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Count: $counter'),
            CounterIsEven(),
            EvenCounter(),
            EvenCounterFromProvider(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).increment();
          final isEven = ref.watch(isEvenProvider);
          if (isEven)
            ref.read(evenCounterProviderAsSeparateState.notifier).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
