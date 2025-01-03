import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:task/utils/dialogBox.dart';
import 'package:task/utils/todoTile.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Map<String, dynamic>> tasks = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final String? tasksString = prefs.getString('tasks');
    if (tasksString != null) {
      setState(() {
        tasks.addAll(List<Map<String, dynamic>>.from(jsonDecode(tasksString)));
      });
    }
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('tasks', jsonEncode(tasks));
  }

  void addNewTask(String taskTitle) {
    if (taskTitle.isNotEmpty) {
      setState(() {
        tasks.add({'title': taskTitle, 'completed': false});
      });
    }
    _saveTasks();
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
    _saveTasks();
  }

  void taskCompletion(int index, bool value) {
    setState(() {
      tasks[index]['completed'] = value;
    });
    _saveTasks();
  }

  void newTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          onAdd: (taskTitle) {
            addNewTask(taskTitle);
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tasks.isEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Add a new task to get started",
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                Center(
                    child: Lottie.asset(
                  'assets/task1.json',
                  fit: BoxFit.fill,
                )),
              ],
            )
          : ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return TodoTile(
                  title: tasks[index]['title'],
                  isChecked: tasks[index]['completed'],
                  onChanged: (value) {
                    taskCompletion(index, value!);
                  },
                  onDelete: () => deleteTask(index),
                );
              },
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: newTask,
        child: const Icon(Icons.add),
      ),
    );
  }
}
