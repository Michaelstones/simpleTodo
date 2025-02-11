import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/task.dart';

// all CRUD operations for Db
class HiveDataStore {
  // box name is a string
  static const boxName = 'tasks';

  //current box is a hive box saved here
  final Box<Task> box = Hive.box<Task>(boxName);

  // add new task
  Future<void> addTask(Task task) async {
    await box.put(task.id, task);
  }

  // get single task
  Future<Task?> getTask(String id) async {
    return box.get(id);
  }

  // update task
  Future<void> updateTask(Task task) async {
    await task.save();
  }

  // delete task
  Future<void> deleteTask(Task task) async {
    await task.delete();
  }

  // listen to changes on box
  // use to update UI
  ValueListenable<Box<Task>> listenToBox() => box.listenable();
}
