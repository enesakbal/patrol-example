import 'package:flutter/material.dart';
import 'package:patrol_example/counter_example/counter_example.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterExample(),
    );
  }
}
