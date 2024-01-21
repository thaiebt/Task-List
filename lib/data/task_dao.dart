import 'package:sqflite/sqflite.dart';
import 'package:task_list/components/task_card_widget.dart';
import 'package:task_list/data/database.dart';

//DAO -> Data Access Object
class TaskDao {
  static String tableSql = "CREATE TABLE $_tableName("
  "$_name TEXT, " 
  "$_difficulty INTEGER, "
  "$_image TEXT)";

  static const String _tableName = "taskTable";
  static const String _name = "name";
  static const String _difficulty = "difficulty";
  static const String _image = "image";

  save(TaskCardWidget task) async {
    final Database dataBase = await getDataBase();
    var itemExists = await getTask(task.taskTitle);
    if (itemExists.isEmpty) {
      return await dataBase.insert(_tableName, toMap(task))
    }

    return await dataBase.update(_tableName, toMap(task), where: "$_name = ?", whereArgs: [task.taskTitle]);
  }

  Future<List<TaskCardWidget>> getAll() async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(_tableName);
    return toList(result);
  }

  Future<List<TaskCardWidget>> getTask(String taskName) async {
    final Database dataBase = await getDataBase();
    final List<Map<String, dynamic>> result = await dataBase.query(_tableName, where: "$_name = ?", whereArgs: [taskName]);
    return toList(result);
  }

  delete(String taskName) async {
    final Database dataBase = await getDataBase();
    await dataBase.delete(_tableName, where: "$_name = ?", whereArgs: [taskName]);
  }

  List<TaskCardWidget> toList(List<Map<String, dynamic>> taskist) {
    final List<TaskCardWidget> list = [];
    for (Map<String, dynamic> item in taskist) {
      final TaskCardWidget task = TaskCardWidget(taskTitle: item[_name], dificult: item[_difficulty], image: item[_image]);
      list.add(task);
    }
    return list;
  }

  Map<String, dynamic> toMap(TaskCardWidget task) {
    final Map<String, dynamic> taskMap = {};
    taskMap[_name] = task.taskTitle;
    taskMap[_difficulty] = task.dificult;
    taskMap[_image] = task.image;

    return taskMap;
  }
}