import 'package:flutter/material.dart';
import 'package:patrol_example/todo_example/todo_model.dart';
import 'package:patrol_example/todo_example/todo_service.dart';
import 'package:provider/provider.dart';

class TodoExample extends StatelessWidget {
  const TodoExample({super.key});

  @override
  Widget build(BuildContext context) {
    final todoService = Provider.of<TodoService>(context);
    
    return Scaffold(
      appBar: AppBar(title: const Text('Todo App')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FloatingActionButton(
            onPressed: () {
              todoService.addTodo(
                TodoModel(
                  id: todoService.todoList.length + 1,
                  title: 'Todo: ${(todoService.todoList.length + 1).toString()}',
                  done: false,
                ),
              );
            },
            tooltip: 'Add Todo',
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: todoService.clearAllTodos,
            tooltip: 'Clear Todos',
            child: const Icon(Icons.delete),
          ),
        ],
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
                    onChanged: (_) => todoService.toggleTodo(todo.id ?? 0),
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
                    onChanged: (_) => todoService.toggleTodo(todo.id ?? 0),
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
