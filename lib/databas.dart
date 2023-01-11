import 'dart:async';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'task.dart';

class Databasehelper {
  Future<Database> database() async {
    return openDatabase(
      join(await getDatabasesPath(), 'todo.db'),
      onCreate: (db, version) {
        return db.execute(
          "CREATE TABLE tasks(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, isDone INTEGER)",
        );
      },
      version: 1,
    );
  }

  Future<int> addUppgift(minuppgift task) async {
    int taskID = 0;
    Database _db = await database();
    await _db
        .insert('tasks', task.toMap(),
            conflictAlgorithm: ConflictAlgorithm.replace)
        .then((value) {
      taskID = value;
    });
    return taskID;
  }

  Future<List<minuppgift>> getUppgifter() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap = await _db.query('tasks');
    print(taskMap);
    return List.generate(taskMap.length, (index) {
      return minuppgift(
          id: taskMap[index]['id'],
          title: taskMap[index]['title'],
          isDone: taskMap[index]['isDone']);
    });
  }

  Future<List<minuppgift>> getDoneTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap =
        await _db.rawQuery('select * from tasks where isDone=?', [1]);
    return List.generate(taskMap.length, (index) {
      return minuppgift(
          id: taskMap[index]['id'],
          title: taskMap[index]['title'],
          isDone: taskMap[index]['isDone']);
    });
  }

  Future<List<minuppgift>> getNotDoneTasks() async {
    Database _db = await database();
    List<Map<String, dynamic>> taskMap =
        await _db.rawQuery('select * from tasks where isDone=?', [0]);

    return List.generate(taskMap.length, (index) {
      return minuppgift(
          id: taskMap[index]['id'],
          title: taskMap[index]['title'],
          isDone: taskMap[index]['isDone']);
    });
  }

  Future<void> updatetaskisdone(int id, int isDone) async {
    Database _db = await database();
    await _db
        .rawUpdate("UPDATE tasks SET isDone = '$isDone' WHERE id == '$id'");
  }

  Future<void> raderatask(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM tasks WHERE id == '$id'");
  }

  Future<void> raderaallatask(int id) async {
    Database _db = await database();
    await _db.rawDelete("DELETE FROM tasks where id != '$id'");
  }
}
