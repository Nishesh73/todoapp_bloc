import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  //it is similar to like, delete, comment functionality function be aware
  //reusable widget
  final String taskName;
  final bool taskComplete;
  final Function(bool?)?
      onChanged; //rember i need (value){}annynomous function with parameter

  TodoTile(
      {super.key,
      required this.taskName,
      required this.taskComplete,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Colors.yellow, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          Checkbox(
            value: taskComplete,
            onChanged: onChanged,
            activeColor: Colors.black,
          ),
          //here onChanged is basically pass from other page as (bool){}

          Text(
            taskName,
            style: TextStyle(
                decoration:
                    taskComplete == true ? TextDecoration.lineThrough : TextDecoration.none),
          ),
        ],
      ),
    );
  }
}
