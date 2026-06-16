import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_app/home.dart';
import 'package:todo_app/todo_controller.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodoController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false, home: Home(),
      ),
    )
  );


  //home: ChangeNotifierProvider(create: (context) => TodoController(),child: Home(),);
}
