import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskapp/todo/data.dart';
import 'package:taskapp/todo/database.dart';
import 'package:taskapp/todo/dialog.dart';
class TodoApp extends StatefulWidget {
  const TodoApp({super.key});

  @override
  State<TodoApp> createState() => _TodoAppState();
}  




 
class _TodoAppState extends State<TodoApp> {
TodoDataBase db = TodoDataBase();
  // refrence the box
  final _myBox = Hive.box("TodoData");

  final _controller = TextEditingController();
 
 void checkBoxChange(bool? value, index){
   setState(() {
     db.ToDo[index][1] = !db.ToDo[index][1];
   });
   db.updateData();
 }
 //saving task
  void saveNewTask(){
    setState(() {
      db.ToDo.add([_controller.text,false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
    db.updateData();
  }
void createTask(){
  showDialog(
    context: context, 
    builder: (contetx){
      return DialogBox(
        controller: _controller,
        onSave: () {
          saveNewTask();
        }, 
        onCancel: () {
          Navigator.pop(context);
          },
      );
    }
   );
  }
            
  void deletetask(int index){
    setState(() {
      db.ToDo.removeAt(index);
    });
    db.updateData();
  }
  @override
void initState(){

  //if first time

  if(_myBox.get("ToDoList") == null){
    db.createinitialData();
  }
  //if not the first time
  else{
    db.loadData();
  }
 super.initState();
} 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.yellow[200],
      appBar: AppBar(
        toolbarHeight: 65,
        elevation: 0,
        title: Text("TO DO"),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: db.ToDo.length,
        itemBuilder: (BuildContext, int index){
        return toDo(
          taskName: db.ToDo[index][0], 
          taskComplite: db.ToDo[index][1], 
          onChange: (value){
            checkBoxChange(value,index);
          },
          deleteTask: (context) {
            deletetask(index);
          },
          );
        }
      ),
      floatingActionButton: FloatingActionButton(
        elevation: 4,
        onPressed: () {
          createTask();
        },
        child: Icon(Icons.add),
        ),
    );
  }
}