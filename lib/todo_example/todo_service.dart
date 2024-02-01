import 'package:patrol_example/todo_example/todo_model.dart';

class TodoService {
  final todoList = <TodoModel>[];

  List<TodoModel> get finishedTodoList => todoList.where((todo) => todo.done ?? false).toList();

  List<TodoModel> get unfinishedTodoList => todoList.where((todo) => !(todo.done ?? false)).toList();

  void add(TodoModel todo) {
    todoList.add(todo);
  }

  void remove(TodoModel todo) {
    todoList.remove(todo);
  }

  void toggle(TodoModel todo) {
    todo.done = !(todo.done ?? false);
  }

  void clear() {
    todoList.clear();
  }
}
