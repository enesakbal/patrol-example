import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:patrol_example/todo_example/todo_example.dart';
import 'package:patrol_example/todo_example/todo_model.dart';
import 'package:patrol_example/todo_example/todo_service.dart';
import 'package:patrol_finders/patrol_finders.dart';
import 'package:provider/provider.dart';

void main() {
  testWidgets(
    'todo is added when floating action button is tapped',
    (WidgetTester tester) async {
      PatrolTester $ = PatrolTester(
        tester: tester,
        config: const PatrolTesterConfig(),
      );
      final todoService = TodoService();

      await $.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => todoService,
          child: const MaterialApp(home: TodoExample()),
        ),
      );

      expect(todoService.todoList.length, 0);

      await $.tap(find.byIcon(Icons.add));

      expect(todoService.todoList.length, 1);
      expect(todoService.todoList[0].title, 'Todo: 1');
      expect(todoService.todoList[0].done, false);
    },
  );

  testWidgets(
    'todo is toggled when checkbox is tapped',
    (WidgetTester tester) async {
      PatrolTester $ = PatrolTester(
        tester: tester,
        config: const PatrolTesterConfig(),
      );
      final todoService = TodoService();

      await $.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => todoService,
          child: const MaterialApp(home: TodoExample()),
        ),
      );

      final tTodo = TodoModel(
        id: 1,
        title: 'Test Todo',
        done: false,
      );

      todoService.addTodo(tTodo);

      expect(tTodo.done, false);

      await $.tap(find.byType(Checkbox));

      expect(tTodo.done, true);
    },
  );

  testWidgets(
    'all todos must removed when floating action button is tapped',
    (WidgetTester tester) async {
      PatrolTester $ = PatrolTester(
        tester: tester,
        config: const PatrolTesterConfig(),
      );
      final todoService = TodoService();

      await $.pumpWidget(
        ChangeNotifierProvider(
          create: (_) => todoService,
          child: const MaterialApp(home: TodoExample()),
        ),
      );

      final tTodo1 = TodoModel(id: 1, title: 'Test Todo 1', done: false);
      final tTodo2 = TodoModel(id: 2, title: 'Test Todo 2', done: false);
      final tTodo3 = TodoModel(id: 3, title: 'Test Todo 3', done: false);

      todoService.addTodo(tTodo1);
      todoService.addTodo(tTodo2);
      todoService.addTodo(tTodo3);

      expect(todoService.todoList.length, 3);

      await $.tap(find.byIcon(Icons.delete));

      expect(todoService.todoList.length, 0);
    },
  );
}
