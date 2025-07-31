import 'package:hive/hive.dart';
part 'task_status.g.dart';

@HiveType(typeId: 0)
enum TaskStatus {
  @HiveField(0)
  completed,

  @HiveField(1)
  pending,

  @HiveField(2)
  delayed,

  @HiveField(3)
  lateSubmission,

  @HiveField(4)
  archived,
}
