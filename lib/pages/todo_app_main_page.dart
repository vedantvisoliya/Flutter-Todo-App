import 'package:flutter/material.dart';
import 'package:todo_app/providers/todo_provider.dart';
import 'package:todo_app/todo_tile.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/dialog_box.dart';

class TodoAppMainPage extends StatefulWidget {
  const TodoAppMainPage({super.key});

  @override
  State<TodoAppMainPage> createState() => _TodoAppMainPageState();
}

class _TodoAppMainPageState extends State<TodoAppMainPage> {
  @override
  Widget build(BuildContext context) {
    final todoList = context.watch<TodoProvider>().todoList;
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
              return DialogBox();
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
          itemCount: todoList.length,
          itemBuilder: (context, index) {
            final todo = todoList[index][0];
            return TodoTile(title: todo, index: index);
          },
        ),
      ),
    );
  }
}
