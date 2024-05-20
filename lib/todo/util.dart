import 'package:flutter/material.dart';

//do not confuse ()=> is simply this (){}
class dialogBox extends StatelessWidget {
  VoidCallback onSave;
  VoidCallback onCancel;
  TextEditingController controller;
  dialogBox(
      {super.key,
      required this.controller,
      required this.onSave,
      required this.onCancel});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(9)),
      content: Container(
        height: 150,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: TextField(
                  controller: controller,
                  decoration: InputDecoration(border: OutlineInputBorder())),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      onSave(); //if i press function function will call
                      //duiota add gariraxa means list
                    },
                    child: Text("Save")),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    onPressed: () {
                      onCancel(); //function call
                    },
                    child: Text("Cancel")),
              ],
            )
          ],
        ),
      ),
    );
  }
}
