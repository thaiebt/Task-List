import 'package:flutter/material.dart';
import 'package:task_list/components/task_card_widget.dart';

class TaskInherited extends InheritedWidget {
   TaskInherited({Key? key, required Widget child}) : super(key: key, child: child);

  final List<TaskCardWidget> list = [
    TaskCardWidget(taskTitle: "Aprender inglês", dificult: 1, image: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",),
    TaskCardWidget(taskTitle: "Aprender inglês", dificult: 3, image: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",),
    TaskCardWidget(taskTitle: "Aprender inglês", dificult: 2, image: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",),
    TaskCardWidget(taskTitle: "Aprender inglês", dificult: 5, image: "https://pbs.twimg.com/media/Eu7m692XIAEvxxP?format=png&name=large",),
  ];

  void newTask(String name, String image, int difficulty) {
    list.add(TaskCardWidget(taskTitle: name, dificult: difficulty, image: image,));
  }

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result = context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, "No TaskInherited found in context");
    return result!;
  }

  @override
  bool updateShouldNotify(TaskInherited oldWidget) {
    return oldWidget.list.length != list.length;
  }
}