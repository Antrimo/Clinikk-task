import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task/theme/theme_provider.dart';

import 'screen/tab_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const TabScreen(),
      theme: Provider.of<ThemeProvider>(context).themeData,
    );
  }
}
