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

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});


@override
State<ToDoScreen> createState() => ToDoScreenState();
}
class ToDoScreenState extends State<ToDoScreen>{
  List<String> tasks= [];

TextEditingController controller = TextEditingController();

void addTask() {

  String newTask= controller.text.trim();
  if(newTask.isNotEmpty) {
    setState (() {
      tasks.add(newTask);
      controller.clear();
  });
  }
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(

  appBar: AppBar(
    title: const Text("To-Do List"),

  ),
    body: Padding(
    padding: const EdgeInsets.all(16.0),
    child: Column(
    children: [
    Row(
    children: [
    Expanded(
    child: TextField(
    controller: controller,
    decoration: const InputDecoration(
    hintText: "Enter your task",
    border: OutlineInputBorder(),

    ),
    ),
    ),


    const SizedBox(width: 10),
    ElevatedButton(
      onPressed: addTask,
      child: const Text("Add"),
    ),
    ],
  ),
      const SizedBox(height: 20),
      Expanded(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (context, index) {
            return Card(
              child: ListTile(
                title: Text(tasks[index]),
              ),
            );
          },
        ),
      ),
    ],
    ),
    ),
  );
  }
}

