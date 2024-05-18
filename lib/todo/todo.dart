import 'package:bloc_basic/todo/todotile.dart';
import 'package:bloc_basic/todo/util.dart';
import 'package:flutter/material.dart';

class ToDoListClass extends StatefulWidget {
  const ToDoListClass({super.key});

  @override
  State<ToDoListClass> createState() => _ToDoListClassState();
}

class _ToDoListClassState extends State<ToDoListClass> {
  TextEditingController controller = TextEditingController();
  //here the task name related with false or true that's why use nested list
  List<List<dynamic>> todo = [
    ["Suryanamaskar", false],
    ["Yoga", false]
  ];

  //
  aDD() {
    showDialog(
        // barrierDismissible: false,

        context: context,
        builder: (context) {
          return dialogBox(controller,todo, context);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.yellow[300],
          foregroundColor: Colors.black,
          onPressed: () {
            aDD();
          },
          child: Icon(Icons.add),
        ),
        appBar: AppBar(
          title: Text(
            "To do",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
            shrinkWrap: true,
            itemCount: todo.length,
            itemBuilder: (context, index) {
              return TodoTile(
                taskName: todo[index][0],
                taskComplete: todo[index][1], //will change value on the basis
                //of switch status
                //important concept : initializer, nearly equal to =, taskname = todo[index]
                onChanged: (value) {
                  setState(() {
                    todo[index][1] = value;
                    //here we switch value
                  });
                },
              );
            }));
  }
}
