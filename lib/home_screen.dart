import 'package:flutter/material.dart';
import 'package:task/utils/todoTile.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  void newTask(){

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(child: Text("Todo App",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),)),
        backgroundColor: Colors.green,
      ),
      body: ListView.builder(
          itemCount: 4,
          itemBuilder: (context,index) {
            return const TodoTile();
          }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
