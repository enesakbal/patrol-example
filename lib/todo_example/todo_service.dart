import 'package:flutter/material.dart';
import 'package:patrol_example/todo_example/todo_model.dart';

class TodoService extends ChangeNotifier {
  final todoList = <TodoModel>[];

  List<TodoModel> get finishedTodoList => todoList.where((todo) => todo.done ?? false).toList();

  List<TodoModel> get unfinishedTodoList => todoList.where((todo) => !(todo.done ?? false)).toList();

  void addTodo(TodoModel todo) {
    todoList.add(todo);
    notifyListeners();
  }

  void removeTodo(int id) {
    todoList.removeWhere((todo) => todo.id == id);
    notifyListeners();
  }

  void toggleTodo(int id) {
    todoList.firstWhere((todo) => todo.id == id).done = !(todoList.firstWhere((todo) => todo.id == id).done ?? false);
    notifyListeners();
  }

  void clearAllTodos() {
    todoList.clear();
    notifyListeners();
  }
}
