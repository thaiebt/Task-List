import 'package:flutter/material.dart';
import 'package:task_list/data/task_inherited.dart';
import 'package:task_list/screens/new_task_screen.dart';

// ignore: must_be_immutable
class HomePageWidget extends StatefulWidget {
  const HomePageWidget({super.key});

  @override
  State<HomePageWidget> createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Tarefas"),
      ),
      body: ListView(
        padding: const EdgeInsets.only(bottom: 80, top: 16),
        children: TaskInherited.of(context).list),
      backgroundColor: const Color.fromARGB(255, 206, 220, 227),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (newContext) => NewTaskScreen(taskContext: context,)));
        }, 
        child: const Icon(Icons.add),
      ),
    );
  }
}