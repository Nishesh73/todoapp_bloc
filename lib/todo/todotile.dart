import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class TodoTile extends StatelessWidget {
  //it is similar to like, delete, comment functionality function be aware
  //reusable widget
  Function(BuildContext) onslide;
  final String taskName;
  final bool taskComplete; //this is bool value for switch require
  final Function(
          bool?)? //if i donot give parameterized function then i can't use it
      onChanged; //remember i need (value){}annynomous function with parameter

  TodoTile(
      {super.key,
      required this.onslide,
      required this.taskName,
      required this.taskComplete,
      required this.onChanged}); //reference of function

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 214, 193, 193),
          borderRadius: BorderRadius.circular(10)),
      child: SizedBox(
        height: 50,
        child: Slidable(
          endActionPane: ActionPane(motion: ScrollMotion(), children: [
            SlidableAction(
              onPressed: onslide,
              icon: Icons.delete,
              borderRadius: BorderRadius.circular(5),
              backgroundColor: Colors.red,
            ),
          ]),
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
                    decoration: taskComplete == true
                        ? TextDecoration.lineThrough
                        : TextDecoration.none),
              ),
            ],
          ),
        ),
      ),
    );
    // );
  }
}
