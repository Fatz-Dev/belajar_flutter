import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:latihan_materi_8/provider.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final angkaRiverpod = ref.watch(counterProvider);
    return Scaffold(
      appBar: AppBar(title: Text('Home Page')),
      body: Center(
        child: Text(
          angkaRiverpod.toString(),
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      floatingActionButton: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              onPressed: () {
                // context.read<CounterModel>().increment();
                ref.read(counterProvider.notifier).state += 1;
              },
              child: Icon(Icons.add),
            ),
            SizedBox(height: 16), // Add some spacing between the buttons
            FloatingActionButton(
              onPressed: () {
                // context.read<CounterModel>().decrement();
                ref.read(counterProvider.notifier).state -= 1;
              },
              child: Icon(Icons.remove),
            ),
          ],
        ),
      ),
    );
  }
}
