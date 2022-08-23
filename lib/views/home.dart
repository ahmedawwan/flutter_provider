import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_flutter/providers/counter.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var counterProvider = context.watch<CounterProvider>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Column(
        children: [
          counterCard(
            counterProvider.decrementCounter1,
            counterProvider.incrementCounter1,
            counterProvider.counter1,
          ),
          counterCard(
            counterProvider.decrementCounter2,
            counterProvider.incrementCounter2,
            counterProvider.counter2,
          ),
          counterCard(
            counterProvider.decrementCounter3,
            counterProvider.incrementCounter3,
            counterProvider.counter3,
          ),
          const SizedBox(height: 50),
          Text('Sum: ${counterProvider.sum}'),
        ],
      ),
    );
  }

  Card counterCard(Function decrement, Function increment, int counter) {
    return Card(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //decrement counter
          IconButton(
            icon: const Icon(Icons.minimize),
            onPressed: () {
              decrement();
            },
          ),
          //counter value
          Text('$counter'),
          // increment counter
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              increment();
            },
          ),
        ],
      ),
    );
  }
}
