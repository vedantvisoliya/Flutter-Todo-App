import 'package:flutter/material.dart';

class TodoProvider extends ChangeNotifier{
  final List<List<dynamic>>todoList = [
    ["Do Exercise", false],
    ["Eat Food", false],
    ["Do HomeWork", false],
    ["Sleep", false],
  ];

  void addTodo(String todo){
    todoList.add([todo, false]);
    notifyListeners();
  }

  void removeTodo(int index){
    todoList.remove(todoList[index]);
    notifyListeners();
  }
}