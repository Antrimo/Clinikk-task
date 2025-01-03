import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:task/utils/dialogBox.dart';
import 'package:task/utils/todoTile.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  final List<Map<String, dynamic>> tasks = [];

  void addNewTask(String taskTitle) {
    if (taskTitle.isNotEmpty) {
      setState(() {
        tasks.add({'title': taskTitle, 'completed': false});
      });
    }
  }

  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  void taskCompletion(int index, bool value) {
    setState(() {
      tasks[index]['completed'] = value;
    });
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
