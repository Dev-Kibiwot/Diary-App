import 'package:flutter/material.dart';
import 'package:taskapp/todo/buttons.dart';

class DialogBox extends StatelessWidget {
  final controller;
  VoidCallback onSave;
  VoidCallback onCancel;
   DialogBox({
    super.key, 
    required this.controller,
    required this.onSave,
    required this.onCancel,
    
    });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.yellow[300],
      content: Container(
        height: 120,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TextField(              
              controller: controller,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(10),
                border: OutlineInputBorder(),
                hintText: "Add new task"
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                MyButtons(
                  name: "Save", 
                  onpressed: (){
                    onSave();
                  }
                  ),
                const SizedBox(width: 20,),
                MyButtons(
                  name: "Cancel", 
                  onpressed: (){
                    onCancel();
                  }
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
