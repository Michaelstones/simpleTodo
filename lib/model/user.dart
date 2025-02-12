import 'package:hive_flutter/hive_flutter.dart';

part 'user.g.dart'; // Required for Hive type adapter

@HiveType(typeId: 1) // Unique type ID for Hive
class User extends HiveObject {
  @HiveField(0)
  final String userName;

  @HiveField(1)
  final String userEmail;

  @HiveField(2)
  final String token;

  User({
    required this.userName,
    required this.userEmail,
    required this.token,
  });
}
