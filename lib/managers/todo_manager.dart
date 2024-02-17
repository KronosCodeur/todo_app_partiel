import 'package:flutter/cupertino.dart';
import 'package:todo/models/todo.dart';

class TodoManager extends ChangeNotifier {
  List<Todo> todos = [];
  Todo? currentTodo;
  String title = '';
  String date = '';
  bool status = false;
  setDate(d) {
    date = d;
    notifyListeners();
  }

  setTitle(t) {
    title = t;
    notifyListeners();
  }

  addTodo() {
    todos
        .add(Todo(title: title, endDate: DateTime.parse(date), status: status));
    notifyListeners();
  }

  removeTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  updateTodo(Todo todo) {
    todos.remove(currentTodo!);
    currentTodo = todo;
    todos.add(currentTodo!);
  }

  setCurrentTodo(Todo todo) {
    currentTodo =
        Todo(title: title, endDate: DateTime.parse(date), status: status);
    notifyListeners();
  }

  updateStatus(bool status) {
    currentTodo!.status = status;
    notifyListeners();
  }
}
