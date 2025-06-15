import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
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

List<Map<String,dynamic>> tasks= [];
TextEditingController controller = TextEditingController();

@override
void initState(){
  super.initState();
  loadTasks();

}


void addTask() {

  String newTask= controller.text.trim();
  if(newTask.isNotEmpty) {
    setState (() {
      tasks.add({"title": newTask, "isDone": false});
      controller.clear();
  });
  saveTasks();
  }
  }

void toggleDone(int index) {
  setState(() {
    tasks[index]['isDone'] = !tasks[index]['isDone'];
  });
  saveTasks();
}

// 🟩 Delete task
void deleteTask(int index) {
  setState(() {
    tasks.removeAt(index);
  });
  saveTasks();
}
  @override
  Widget build(BuildContext context) {
  return Scaffold(

  appBar: AppBar(
    title: const Text("To-Do List"),
    centerTitle:true,
    backgroundColor:Colors.blue,
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
                  return Card(
              child: ListTile(
              leading: Checkbox(
                  value: task['isDone'],
                  onChanged: (_) => toggleDone(index),
              ),


              title: Text(
              task['title'], // ✅ Corrected map access
            style: TextStyle(
            decoration: task['isDone']
            ? TextDecoration.lineThrough
                : TextDecoration.none,


            );

            );
            trailing: IconButton(
            icon: const Icon(Icons.delete),
            onPressed: () => deleteTask(index),
            ),
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


