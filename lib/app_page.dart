import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// Simplest possible model, with just one field.
///
/// [ChangeNotifier] is a class in `flutter:foundation`. [Counter] does
/// _not_ depend on Provider.
class Counter with ChangeNotifier {
  int value = 0;

  void increment() {
    value += 1;
    notifyListeners();
  }
}

class CounterProviderApp extends StatelessWidget {
  const CounterProviderApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Provide the model to all widgets within the app. We're using
    // ChangeNotifierProvider because that's a simple way to rebuild
    // widgets when a model changes. We could also just use
    // Provider, but then we would have to listen to Counter ourselves.
    //
    // Read Provider's docs to learn about all the available providers.
    return ChangeNotifierProvider(
      // Initialize the model in the builder. That way, Provider
      // can own Counter's lifecycle, making sure to call `dispose`
      // when not needed anymore.
      create: (context) => Counter(),
      child: const CounterProviderPage(),
    );
  }
}

class CounterProviderPage extends StatelessWidget {
  const CounterProviderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(toString())),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Button is clicked ${context.watch<Counter>().value} times:'),
            // Consumer looks for an ancestor Provider widget
            // and retrieves its model (Counter, in this case).
            // Then it uses that model to build widgets, and will trigger
            // rebuilds if the model is updated.
            /*  Consumer<Counter>(
              // This widget depends on the Counter model.
              // It does not rebuild if the model changes.
              builder: (context, counter, child) {
                return Text(
                  '${counter.value}',
                );
              },
            ), */
            const CounterProviderValue(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // You can access your providers anywhere you have access
          // to the context. One way is to use Provider.of<Counter>(context).
          //
          // The provider package also defines extension methods on context
          // itself. You can call context.watch<Counter>() in a build method
          // of any widget to access the current state of Counter, and to ask
          // Flutter to rebuild your widget anytime Counter changes.
          //
          // You can't use context.watch() outside build methods, because that
          // often leads to subtle bugs. Instead, you should use
          // context.read<Counter>(), which gets the current state
          // but doesn't ask Flutter for future rebuilds.
          //
          // Since we're in a callback that will be called whenever the user
          // taps the FloatingActionButton, we are not in the build method here.
          // We should use context.read().
          var counter = context.read<Counter>();
          // print(counter.value);
          counter.increment();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

class CounterProviderValue extends StatelessWidget {
  const CounterProviderValue({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print('CounterProviderValue build'); // this widget gets rebuild every time the model changes
    // var counter = context.watch<Counter>();
    var counterValue = context.select((Counter element) => element.value);
    return Text(
      // '${counter.value}',
      '$counterValue',
    );
  }
}
