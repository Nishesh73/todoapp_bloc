import 'package:bloc_basic/todo/hivedatabase.dart';
import 'package:bloc_basic/todo/todotile.dart';
import 'package:bloc_basic/todo/util.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ToDoListClass extends StatefulWidget {
  const ToDoListClass({super.key});

  @override
  State<ToDoListClass> createState() => _ToDoListClassState();
}

class _ToDoListClassState extends State<ToDoListClass> {
  //access the todoList
  HiveDatabase hD = HiveDatabase();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var mybox = Hive.box("mybox");
    if (mybox.get("TODOLIST") == null) {
      hD.todo;
    } else {
      hD.loadData();
    }
  }

  TextEditingController controller = TextEditingController();

  aDD() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return dialogBox(
            // (){}//annynomous function may have void or return type eg.(){return 2}or(){}
            onCancel: () {
              Navigator.of(context).pop();
            },
            onSave: save, //reference of function
            controller: controller,
          );
        });
  }
//save data in list

  save() {
    if (controller.text.isEmpty) {
      return;
    }
    hD.todo.add([
      controller.text,
      false
    ]); //i added not data inside list but list inside list of data
    Navigator.of(context).pop();
    setState(() {});

    hD.updateData();
  }

  deleteBySlide(int index) {
    hD.todo.removeAt(index);

    setState(() {});
// hD.deleteFromDatabse(index);
    var mybox = Hive.box("mybox");
//now we write the latest todolist after performing deletion then we stored on hive works like
//delete operation
    mybox.put("TODOLIST", hD.todo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.yellow[400],
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
        body: hD.todo.isEmpty
            ? Center(
                child: Text(
                "Add task to perform",
                style: TextStyle(fontWeight: FontWeight.bold),
              ))
            : ListView.builder(
                shrinkWrap: true,
                itemCount: hD.todo.length,
                itemBuilder: (context, index) {
                  return TodoTile(
                    onslide: (context) {
                      deleteBySlide(index);
                    },

                    taskName: hD.todo[index][0],
                    taskComplete: hD.todo[index]
                        [1], //it is actually a value we pass for each checkbox
                    //will change value on the basis of switch status
                    //important concept : initializer, nearly equal to =, taskname = todo[index][0]
                    onChanged: (value) {
                      //function call happened here function with parameter
                      setState(() {
                        hD.todo[index][1] = value;

                        //here we switch value
                      });

                      hD.updateData();
                    },
                  );
                }));
  }
}
