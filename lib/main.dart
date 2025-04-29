// ignore_for_file: unused_local_variable

import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_app_main_page.dart';
import 'package:hive_flutter/hive_flutter.dart';

// darkyellow - 250, 229, 61
// lightyellow - 252, 241, 146

void main() async {
  // init the hive
  await Hive.initFlutter();

  // open a box
  var box = await Hive.openBox('mybox');

  runApp(const MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,        
        theme: ThemeData(
           fontFamily: "Montserrat",
           useMaterial3: true,
        ),
        title: "ToDo App",
        home: const TodoAppMainPage(),
    );
  }
}