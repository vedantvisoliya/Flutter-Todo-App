import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase{
   List todoList = [];

  // reference my box
  final _mybox = Hive.box('mybox');

  // run this method if this is the 1st time ever opening this app
  void createInitialData(){
    todoList = [
      ["follow @heyitsvedu", false],
      ["find One Piece", false],
    ];
  }

  // load the data from the database
  void loadData(){
    todoList = _mybox.get("TODOLIST");
  }

  // update the database
  void updateDataBase(){
    _mybox.put("TODOLIST", todoList);
  }
}