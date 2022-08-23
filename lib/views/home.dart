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

    final List<Map<String, dynamic>> listCounterCards = [
      {
        'decrement': counterProvider.decrementCounter1,
        'increment': counterProvider.incrementCounter1,
        'value': counterProvider.counter1,
      },
      {
        'decrement': counterProvider.decrementCounter2,
        'increment': counterProvider.incrementCounter2,
        'value': counterProvider.counter2,
      },
      {
        'decrement': counterProvider.decrementCounter3,
        'increment': counterProvider.incrementCounter3,
        'value': counterProvider.counter3,
      }
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider Example'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ...listCounterCards.map((element) => counterCard(element)).toList(),
          const SizedBox(height: 50),
          Expanded(
            child: Text(
              'Sum: ${counterProvider.sum}',
              style: const TextStyle(
                fontSize: 32,
              ),
          ),
          ),
        ],
      ),
    );
  }

  Widget counterCard(Map<String, dynamic> counterItem) {
    return Expanded(
      child: Card(
        margin: EdgeInsets.symmetric(vertical: 30, horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //decrement counter
            IconButton(
              icon: const Icon(Icons.minimize),
              onPressed: counterItem['decrement'],
            ),
            //counter value
            Text(counterItem['value'].toString()),
            // increment counter
            IconButton(
              icon: const Icon(Icons.add),
              onPressed: counterItem['increment'],
            ),
          ],
        ),
      ),
    );
  }
}
