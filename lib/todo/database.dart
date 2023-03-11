import 'package:hive_flutter/hive_flutter.dart';

class TodoDataBase{
  List ToDo = [];
  //refrence the hive

final _myBox = Hive.box("TodoData");

// this is the first time opening the app

void createinitialData(){
  List ToDo = [
   ["Do Exercise",false],
   ["Go to wedding",false],
  ];
}

//load data from the database

void loadData(){
 ToDo = _myBox.get("ToDoList");
}

//update the data
void updateData(){
 _myBox.put("ToDoList", ToDo);
}

}