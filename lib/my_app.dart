import 'package:flutter/material.dart';
import 'package:task_list/data/task_inherited.dart';
import 'package:task_list/screens/home_page.dart';
import 'package:task_list/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Task List",
      theme: theme,
      home: TaskInherited(child: const HomePageWidget()),
    );
  }
}