import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/screen/posts_screen.dart';
import 'package:task/screen/todo_screen.dart';

import '../theme/theme_provider.dart';

class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "                   Task",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
            ),
          ),
          backgroundColor: Colors.green,
          bottom: const TabBar(
            tabs: [
              Tab(
                  icon: Icon(
                Icons.list,
                color: Colors.white,
              )),
              Tab(
                  icon: Icon(
                Icons.cloud,
                color: Colors.white,
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            const TodoScreen(),
            PostsScreen(),
          ],
        ),
        drawer: Drawer(
          child: CupertinoSwitch(
            value: Provider.of<ThemeProvider>(context).isDarkMode,
            onChanged: (value) {
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
            },
          ),
        ),
      ),
    );
  }
}
