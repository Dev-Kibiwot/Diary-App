import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class toDo extends StatelessWidget {
  final String taskName;
  final bool taskComplite;
  Function(bool?)? onChange;
  Function(BuildContext?)? deleteTask;
  
   toDo({
    super.key, 
    required this.taskName, 
    required this.taskComplite,
    required this.onChange,
    required this.deleteTask
    
    });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top:25.0,left: 25,right: 25),
      child: Slidable(
        endActionPane: ActionPane(
          motion: StretchMotion(), 
          children: [
            SlidableAction(
              onPressed: deleteTask,
              icon: Icons.delete,
              backgroundColor: Colors.red.shade300,
              borderRadius: BorderRadius.circular(10),
            )
          ]
        ),
        child: Container(
          padding: EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.yellow
          ),
          child: Row(
            children: [
              Checkbox(
                value: taskComplite, 
                onChanged: onChange,
                activeColor: Colors.black,
                ),
              Text(
                taskName,
                style: TextStyle(
                  decoration:
                  taskComplite? 
                  TextDecoration.lineThrough
                  :TextDecoration.none
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}