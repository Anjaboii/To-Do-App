import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const ToDoScreen(),
    );
  }
}

class ToDoScreen extends StatefulWidget {
  const ToDoScreen({super.key});

  @override
  State<ToDoScreen> createState() => ToDoScreenState();
}

class ToDoScreenState extends State<ToDoScreen> {
  List<Map<String, dynamic>> tasks = [];
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadTasks();
  }

  void addTask() {
    String newTask = controller.text.trim();
    if (newTask.isNotEmpty) {
      setState(() {
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

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    saveTasks();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = jsonEncode(tasks);
    await prefs.setString('tasks', encodedData);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedData = prefs.getString('tasks');
    if (encodedData != null) {
      setState(() {
        tasks = List<Map<String, dynamic>>.from(jsonDecode(encodedData));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("To-Do List"),
        centerTitle: true,
        backgroundColor: Colors.blue,
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
                  final task = tasks[index];
                  return Card(
                    child: ListTile(
                      leading: Checkbox(
                        value: task['isDone'],
                        onChanged: (_) => toggleDone(index),
                      ),
                      title: Text(
                        task['title'],
                        style: TextStyle(
                          decoration: task['isDone']
                              ? TextDecoration.lineThrough
                              : TextDecoration.none,
                        ),
                      ),
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
