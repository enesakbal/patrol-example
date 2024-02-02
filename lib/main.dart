import 'package:flutter/material.dart';
import 'package:patrol_example/authentication_example/user_service.dart';
import 'package:patrol_example/todo_example/todo_example.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserService(),
      child: const MaterialApp(
        home: TodoExample(),
      ),
    );
  }
}
