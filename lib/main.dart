import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
        home: ToDoScreen(),

    );
  }

}

class ToDoScreen extends StatefulWidget{
  const ToDoScreen({super.key});

@override
State<ToDoScreen> createState() => ToDoScreenState();

class ToDoScreenState extends State<ToDoScreen>{
  List<String> tasks= [];

TextEditingController controller = TextEditingController();

void addTask() {

  String newTask= controller.text.trim(),
  if(newTask.isNotEmpty) {
    setState (() {
      tasks.add(newTask);
      controller.clear();
  });
  }
  }
  @override
  Widget build(BuildContext context) {
  return scaffold(

  appBar: AppBar(
  title= Text ("Test"),
  ),
  body{
  child: Column(
  children: [
  }
  )
  }


  }
}

