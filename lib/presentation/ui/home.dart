import 'package:flutter/material.dart';
import 'package:flutter_testing/presentation/state/ModelCountController.dart';
import 'package:provider/provider.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text('Тестирование'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              "${context.watch<ModelCountController>().getCount}",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            Expanded(
              child: ListView.builder(
                itemCount:
                    context.watch<ModelCountController>().getCountList.length,
                itemBuilder: (context, index) {
                  return Card(
                    child: Text(
                      "Item:${context.read<ModelCountController>().getCountList[index]} ",
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: context.read<ModelCountController>().onIncrementCount,
            tooltip: 'Increment',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: context.read<ModelCountController>().onDecrementCount,
            tooltip: 'Decrement',
            child: const Icon(Icons.remove_outlined),
          ),
        ],
      ),
    );
  }
}
