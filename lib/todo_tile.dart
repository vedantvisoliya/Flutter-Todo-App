import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {

  final String title;
  final int index;
  final void Function(int index) removeTodo;
  final bool Function(int index) getCheckboxValue;
  final void Function(int index, bool newValue) setCheckboxValue;
  const TodoTile({
    super.key,
    required this.title,
    required this.index,
    required this.removeTodo,
    required this.getCheckboxValue,
    required this.setCheckboxValue,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.endToStart,
        onDismissed: (direction) {
          removeTodo(index);
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
                value: getCheckboxValue(index),
                onChanged: (bool? newValue) {
                  setCheckboxValue(index, newValue!);
                },
                checkColor: Colors.black,
                activeColor: Color.fromRGBO(250, 229, 61, 1),
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.black,
                  decoration: getCheckboxValue(index) ?  TextDecoration.lineThrough : TextDecoration.none,
                ),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ) 
      ),
    );
  }
}