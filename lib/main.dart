import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:taskapp/todo/todo.dart';

void main() async{
  await Hive.initFlutter();
  var Box = await Hive.openBox("TodoData");
  runApp(
     MaterialApp(
      debugShowCheckedModeBanner: false,
      home: TodoApp(),
      theme: ThemeData(primarySwatch: Colors.yellow),
    )
  );
}

