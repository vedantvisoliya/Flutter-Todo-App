import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo_app/database/data.dart';
import 'package:todo_app/todo_tile.dart';
import 'package:todo_app/dialog_box.dart';

class TodoAppMainPage extends StatefulWidget {
  const TodoAppMainPage({super.key});

  @override
  State<TodoAppMainPage> createState() => _TodoAppMainPageState();
}

class _TodoAppMainPageState extends State<TodoAppMainPage> {
  // reference the hive box
  final _mybox = Hive.box('mybox');
  TodoDataBase db = TodoDataBase();

  // add a task to the list
  void addTodo(String task){
    setState(() {
      db.todoList.add([task, false]);
    });
    db.updateDataBase();
  }

  // removing a task from the list
  void removeTodo(int index){
    setState(() {   
      db.todoList.removeAt(index);
    });
    db.updateDataBase();
  }

  // getting checkbox value
  bool getCheckboxValue(int index){
    return (db.todoList[index][1]);
  }

  // setting checkbox value
  void setCheckboxValue(int index, bool value){
    setState(() {
      db.todoList[index][1] = value;
    });
    db.updateDataBase();
  }

  @override void initState() {
    super.initState();
    if (_mybox.get("TODOLIST") == null){
      db.createInitialData();
    }
    else {
      db.loadData(); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(252, 241, 146, 1),
      appBar: AppBar(
        title: const Text(
          "TO DO",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Color.fromRGBO(250, 229, 61, 1),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(250, 229, 61, 1), 
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        elevation: 7,
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) {
              return DialogBox(
                addTodo: (task) {
                  addTodo(task);
                },
              );
            }
          );
        },
        child: Icon(
          Icons.add,
          color: Colors.black,  
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: db.todoList.length,
          itemBuilder: (context, index) {
            final todo = db.todoList[index][0];
            return TodoTile(
              title: todo,
              index: index,
              removeTodo: (index){
                removeTodo(index);
              },
              getCheckboxValue: (index){
                return getCheckboxValue(index);
              },
              setCheckboxValue: (index, value) {
                setCheckboxValue(index, value);
              },
            );
          },
        ),
      ),
    );
  }
}
