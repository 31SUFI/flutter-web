import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testing/Provider/counter-provider.dart';
// Import the Counter class

class CounterScreen extends StatelessWidget {
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    print("object");
    return Scaffold(
      appBar: AppBar(
        title: const Text("Provider Counter Example"),
      ),
      body: Center(
        child: Consumer<Counter>(
          builder: (context, counter, child) {
            print("build");
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Current Count:",
                  style: TextStyle(fontSize: 24),
                ),
                Text(
                  "${counter.count}",
                  style: const TextStyle(
                      fontSize: 48, fontWeight: FontWeight.bold),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: counter.increment,
                      child: const Text("Increment"),
                    ),
                    const SizedBox(width: 20),
                    ElevatedButton(
                      onPressed: counter.decrement,
                      child: const Text("Decrement"),
                    ),
                  ],
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
