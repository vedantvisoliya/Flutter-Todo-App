import 'package:flutter/material.dart';
import 'package:todo_app/pages/todo_app_main_page.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

// darkyellow - 250, 229, 61
// lightyellow - 252, 241, 146

void main() {
    runApp(const MyTodoApp());
}

class MyTodoApp extends StatelessWidget {
  const MyTodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => TodoProvider(),
      child: MaterialApp(
          debugShowCheckedModeBanner: false,        
          theme: ThemeData(
             fontFamily: "Montserrat",
             useMaterial3: true,
          ),
          title: "ToDo App",
          home: const TodoAppMainPage(),
      ),
    );
  }
}