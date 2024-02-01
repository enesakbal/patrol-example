import 'package:flutter/material.dart';
import 'package:patrol_example/todo_example/todo_model.dart';
import 'package:patrol_example/todo_example/todo_service.dart';

class TodoExample extends StatefulWidget {
  const TodoExample({super.key});

  @override
  State<TodoExample> createState() => _TodoExampleState();
}

class _TodoExampleState extends State<TodoExample> {
  late final TodoService todoService;

  @override
  void initState() {
    todoService = TodoService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            todoService.add(
              TodoModel(
                title: 'Todo: ${(todoService.todoList.length + 1).toString()}',
                done: false,
              ),
            );
          });
        },
        tooltip: 'Add Todo',
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          Text('Unfinished Todos: ${todoService.unfinishedTodoList.length}'),
          Expanded(
            child: ListView.builder(
              itemCount: todoService.unfinishedTodoList.length,
              itemBuilder: (_, index) {
                final todo = todoService.unfinishedTodoList[index];
                return ListTile(
                  title: Text(todo.title ?? ''),
                  trailing: Checkbox(
                    value: todo.done,
                    onChanged: (_) => setState(() {
                      todoService.toggle(todo);
                    }),
                  ),
                );
              },
            ),
          ),
          const Divider(),
          Text('Finished Todos: ${todoService.finishedTodoList.length}'),
          Expanded(
            child: ListView.builder(
              itemCount: todoService.finishedTodoList.length,
              itemBuilder: (_, index) {
                final todo = todoService.finishedTodoList[index];
                return ListTile(
                  title: Text(todo.title ?? ''),
                  trailing: Checkbox(
                    value: todo.done,
                    onChanged: (_) => setState(() {
                      todoService.toggle(todo);
                    }),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
