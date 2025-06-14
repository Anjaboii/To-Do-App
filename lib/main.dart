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
      home: Scaffold(
        backgroundColor: Colors.blue[100],

        //AppBar
        appBar: AppBar(
          title: Text("To-Do-List"),
          backgroundColor: Colors.blue,
          elevation: 0,
          centerTitle: true,


          // Body

        ),
      ),
    );
  }

}