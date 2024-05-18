
import 'package:flutter/material.dart';

dialogBox(TextEditingController controller, List<List<dynamic>> todos, BuildContext context){
  return AlertDialog
  
  
  (
    backgroundColor: Colors.yellow[300],
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
    content: Container(height: 150,
    child: Column(children: [
      Padding(
        padding: const EdgeInsets.only(top: 10),
        child: TextField(
          controller: controller ,
          decoration: InputDecoration(border: OutlineInputBorder())
        ),
      ),
      const SizedBox(height: 15,),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

        ElevatedButton(
          style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
          
          ),
          onPressed: (){
          todos.add([controller.text, false]);//duiota add gariraxa means list

          }, child: Text("Save")),
        ElevatedButton(
            style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5))
          
          ),
          onPressed: (){
            Navigator.pop(context);
          }, child: Text("Cancel")),

      ],)


    ],),
    
    ),);
}