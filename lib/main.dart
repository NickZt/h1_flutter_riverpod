import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'states/counter.dart';
import 'states/even_counter.dart';

final _isEvenProvider = Provider<bool>((ref) {
  final counter = ref.watch(_counterProvider);
  return (counter.count % 2 == 0);
});

// StateNotifier and even numbers counter in a separate class
final _evenCounterProviderAsSeparateState =
    StateNotifierProvider<EvenCounterNotifier, EvenCounterModel>((ref) {
  return EvenCounterNotifier();
});

//  StateProvider and even numbers counter in a state provider
final _evenCounterProvider = Provider<int>((ref) {
  ref.listen<bool>(_isEvenProvider, (previous, next) {
    if (next) {
      ref.state++;
    }
  });
  return 0;
});

final _counterProvider =
    StateNotifierProvider<CounterNotifier, CounterModel>((ref) {
  return CounterNotifier();
});

void main() {
  runApp(
    const ProviderScope(child: MyApp()),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends ConsumerWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final counter = ref.watch(_counterProvider).count;
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
          ref.read(_counterProvider.notifier).increment();
          final isEven = ref.watch(_isEvenProvider);
          if (isEven)
            ref.read(_evenCounterProviderAsSeparateState.notifier).increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}

class CounterIsEven extends ConsumerWidget {
  const CounterIsEven({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isEven = ref.watch(_isEvenProvider);
    return Text(isEven ? 'Is even' : 'Not even');
  }
}

class EvenCounterFromProvider extends ConsumerWidget {
  const EvenCounterFromProvider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evenCount = ref.watch(_evenCounterProvider);
    return Text('(StateProvider) Even Number Count: $evenCount');
  }
}

class EvenCounter extends ConsumerWidget {
  const EvenCounter({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final evenCount = ref.watch(_evenCounterProviderAsSeparateState).count;
    return Text(' (StateNotifier) Even Number Count: $evenCount');
  }

}
