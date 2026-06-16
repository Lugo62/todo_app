import 'package:flutter/material.dart';
import 'package:todo_app/todo_model.dart';

class TodoController extends ChangeNotifier {
  List<TodoModel> _todolist = [];
  List<TodoModel> get todolist => _todolist;
  void addtodo(String titlewetyped) {
    _todolist.add(TodoModel(title: titlewetyped));
    notifyListeners();
  }

  void deletetodo(TodoModel todo) {
    _todolist.remove(todo);
    notifyListeners();
  }

  void completed(TodoModel todo) {
    todo.togll();
    notifyListeners();
  }
}
