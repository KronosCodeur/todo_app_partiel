import 'package:flutter/cupertino.dart';
import 'package:todo/models/todo.dart';

class TodoManager extends ChangeNotifier {
  List<Todo> todos = [];
  Todo? currentTodo;
  addTodo(Todo todo) {
    todos.add(todo);
    notifyListeners();
  }

  removeTodo(Todo todo) {
    todos.remove(todo);
    notifyListeners();
  }

  updateTodo(Todo todo) {
    addTodo(todo);
    removeTodo(todo);
    notifyListeners();
  }

  setCurrentTodo(Todo todo) {
    currentTodo = todo;
    notifyListeners();
  }

  updateStatus(Todo todo, bool status) {
    Todo temp = Todo(title: todo.title, endDate: todo.endDate, status: status);
    removeTodo(todo);
    addTodo(temp);
    notifyListeners();
  }
}
