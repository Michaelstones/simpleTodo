import 'package:hive/hive.dart';
import 'package:uuid/uuid.dart';

part 'task.g.dart';

@HiveType(typeId: 0)
class Task extends HiveObject {
  Task(
      {required this.id,
      required this.title,
      required this.subTitle,
      required this.isComplete,
      required this.createdAtTime,
      required this.createdAtDate});

  @HiveField(0)
  final String id;

  @HiveField(1)
  String title;

  @HiveField(2)
  String subTitle;

  @HiveField(3)
  bool isComplete;

  @HiveField(4)
  DateTime createdAtTime;

  @HiveField(5)
  DateTime createdAtDate;

  factory Task.create(
          {required String? title,
          required String? subTitle,
          DateTime? createdAtTime,
          DateTime? createdAtDate}) =>
      Task(
        id: Uuid().v1(),
        title: title ?? '',
        subTitle: subTitle ?? '',
        isComplete: false,
        createdAtTime: createdAtTime ?? DateTime.now(),
        createdAtDate: createdAtDate ?? DateTime.now(),
      );
}
