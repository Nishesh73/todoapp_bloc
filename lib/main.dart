import 'package:bloc_basic/bloc/ui.dart';
import 'package:bloc_basic/todo/todo.dart';
import 'package:flutter/material.dart';
import "package:hive/hive.dart";
import "package:hive_flutter/hive_flutter.dart";

void main() async {
  await Hive.initFlutter(); //initialize
  //open the box
  await Hive.openBox("mybox");
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // home:  Counterclass(),
      debugShowCheckedModeBanner: false,
      //set up the whole app bar color as yellow
      theme: ThemeData(primaryColor: Colors.yellow),
      home: ToDoListClass(),
    );
  }
}
