import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/providers/todo_provider.dart';

class TodoTile extends StatefulWidget {

  final String title;
  final int index;
  const TodoTile({
    super.key,
    required this.title,
    required this.index,
  });

  @override
  State<TodoTile> createState() => _TodoTileState();
}

class _TodoTileState extends State<TodoTile> {
  @override
  Widget build(BuildContext context) {
    final todo = Provider.of<TodoProvider>(context, listen: false).todoList;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          context.read<TodoProvider>().removeTodo(widget.index);
        },
        background: Container(
          alignment: Alignment.centerRight,
          padding: const EdgeInsets.only(right: 20),
          decoration: BoxDecoration(
            color: Colors.red,
            borderRadius: BorderRadius.circular(16.0),
          ),
          child: const Icon(Icons.delete, color: Colors.white), 
        ),
        child: Container(
          padding: EdgeInsets.all(5.0),
          alignment: Alignment.center,
          decoration: BoxDecoration(
            color: Color.fromRGBO(250, 229, 61, 1),
            borderRadius: BorderRadius.circular(16.0)
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Checkbox(
                value: todo[widget.index][1],
                onChanged: (bool? newValue) {
                  setState(() {
                    todo[widget.index][1] = newValue!;
                  });
                },
                checkColor: Colors.black,
                activeColor: Color.fromRGBO(250, 229, 61, 1),
              ),
              Text(
                widget.title,
                style: TextStyle(
                  color: Colors.black,
                  decoration: (todo[widget.index][1])  ?  TextDecoration.lineThrough : TextDecoration.none,
                ),
              ),
            ],
          ),
        ) 
      ),
    );
  }
}