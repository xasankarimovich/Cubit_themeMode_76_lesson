import 'package:bloc_cubit/counter/counter_stream.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final counterStream = CounterStream();
  @override
  void initState() {
    super.initState();
    counterStream.increment();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              counterStream.decrement();
            },
            icon: Icon(Icons.add),
          ),
          IconButton(
            onPressed: () {
              counterStream.increment();

            },
            icon: Icon(Icons.remove),
          ),
        ],
      ),
      body: StreamBuilder<int>(
        stream: counterStream.counter,
        builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
          return Center(
            child: Text(snapshot.data.toString()),
          );
        },
      ),
    );
  }
}
