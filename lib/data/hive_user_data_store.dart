import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:todo/model/user.dart';

class HiveUserDataStore {
  static const String boxName = 'userBox'; // TODO Fix: Make it static

  final Box<User> box = Hive.box<User>(boxName);

  Future<void> saveUser(User user) async {
    await box.put(user.userName, user);
  }

  User? getUser(String username) {
    return box.get(username);
  }

  Future<void> deleteUser(String username) async {
    await box.delete(username);
  }

  ValueListenable<Box<User>> listenToBox() => box.listenable();
}
