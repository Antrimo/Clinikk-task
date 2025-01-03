import 'package:flutter/material.dart';
import 'package:task/screen/todo_screen.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Task Manager",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
          ),
          backgroundColor: Colors.green,
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.list)),
              Tab(icon: Icon(Icons.cloud)),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            TodoScreen(),
            Center(
              child: Text("data"),
            ),
          ],
        ),
      ),
    );
  }
}
