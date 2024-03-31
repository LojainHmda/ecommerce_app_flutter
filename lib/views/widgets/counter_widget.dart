import 'package:flutter/material.dart';

class CounterWidget extends StatelessWidget {
  const CounterWidget({super.key, required this.cubit, required this.counter});
  final dynamic cubit;
  final int counter;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
          color: Colors.grey[100], borderRadius: BorderRadius.circular(24)),
      child: Row(
        children: [
          IconButton(
              onPressed: () async => await cubit.decrementCounter(),
              icon: const Icon(Icons.remove)),
          Text( counter.toString()),
          IconButton(
              onPressed: () async => await cubit.incrementCounter(),
              icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
