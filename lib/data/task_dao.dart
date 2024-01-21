import 'package:task_list/components/task_card_widget.dart';

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

  save(TaskCardWidget task) async {}

  Future<List<TaskCardWidget>> getAll() async {}

  Future<List<TaskCardWidget>> getTask(String taskName) async {}

  delete(String taskName) async {}
}