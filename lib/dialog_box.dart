import 'package:flutter/material.dart';

class DialogBox extends StatelessWidget {

  final void Function(String task) addTodo;
  const DialogBox({
    super.key,
    required this.addTodo,
  });

  @override
  Widget build(BuildContext context) {
    TextEditingController textEditingController = TextEditingController();

    final border = OutlineInputBorder(
      borderRadius: BorderRadius.circular(16.0),
      borderSide: BorderSide(
        color: Colors.black
      )
    );
    return AlertDialog(
      backgroundColor: Color.fromRGBO(250, 229, 61, 1),
      content: SizedBox(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(
              controller: textEditingController,
              decoration: InputDecoration(
                enabledBorder: border,
                focusedBorder: border,
                hintText: "Add a task",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () {
                    addTodo(textEditingController.text);
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Save",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: const Text(
                    "Cancel",
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  )
                ),
              ],
            )
          ],          
        ),
      ), 
    );
  }
}