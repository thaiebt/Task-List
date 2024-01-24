import 'package:flutter/material.dart';
import 'package:task_list/components/task_card_widget.dart';
import 'package:task_list/data/task_dao.dart';
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
        actions: [
          IconButton(
            onPressed: () {setState(() {});}, 
            icon: Icon(Icons.refresh))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 80, top: 16), 
        child: FutureBuilder<List<TaskCardWidget>>(
          future: TaskDao().getAll(), 
          builder: (context, snapshot){
            List<TaskCardWidget>? items = snapshot.data;
            switch (snapshot.connectionState) {
              case ConnectionState.none:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando")
                    ],
                  ),
                );
              case ConnectionState.waiting:
               return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando")
                    ],
                  ),
                );
              case ConnectionState.active:
                return const Center(
                  child: Column(
                    children: [
                      CircularProgressIndicator(),
                      Text("Carregando")
                    ],
                  ),
                );
              case ConnectionState.done:
                if (snapshot.hasData && items != null && items.isNotEmpty) {
                  return ListView.builder(itemCount: items.length, itemBuilder: ( (BuildContext context, int index) {
                    final TaskCardWidget task = items[index];
                    return task;
                  }));
                }
                return const Center(
                  child: Column(children: [
                    Icon(Icons.error_outline, size: 128,),
                    Text("Você não possui nenhuma tarefa", style: TextStyle(fontSize: 32))
                  ]),
                );
            }
            return Text("Erro desconhecido");
          }
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 206, 220, 227),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (newContext) => NewTaskScreen(taskContext: context,))).then((value) => setState(() {
                print("recarregando");
              }));
        }, 
        child: const Icon(Icons.add),
      ),
    );
  }
}