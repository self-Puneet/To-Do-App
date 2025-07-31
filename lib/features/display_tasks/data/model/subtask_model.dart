import 'package:hive/hive.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/features/display_tasks/domain/entities/subtask_entity.dart';

part 'subtask_model.g.dart';

@HiveType(typeId: 1)
class SubtaskModel {
  @HiveField(0)
  final String subtaskId;

  @HiveField(1)
  final DateTime subtaskCreationDate;

  @HiveField(2)
  final DateTime? subtaskDeadline;

  @HiveField(3)
  final String subtaskTitle;

  @HiveField(4)
  final String? subtaskDescription;

  @HiveField(5)
  final TaskStatus subtaskStatus;

  const SubtaskModel({
    required this.subtaskId,
    required this.subtaskCreationDate,
    this.subtaskDeadline,
    required this.subtaskTitle,
    this.subtaskDescription,
    required this.subtaskStatus,
  });

  factory SubtaskModel.fromJson(Map<String, dynamic> json) {
    return SubtaskModel(
      subtaskId: json['id'],
      subtaskCreationDate: DateTime.parse(json['creationDate']),
      subtaskDeadline: json['deadline'] != null
          ? DateTime.parse(json['deadline'])
          : null,
      subtaskTitle: json['taskTitle'],
      subtaskDescription: json['taskDescription'],
      subtaskStatus: TaskStatus.values.firstWhere(
        (e) => e.name == json['taskStatus'],
        orElse: () => TaskStatus.pending,
      ),
    );
  }

  Map<String, dynamic> toJson() => {
    'id': subtaskId,
    'creationDate': subtaskCreationDate.toIso8601String(),
    'deadline': subtaskDeadline?.toIso8601String(),
    'taskTitle': subtaskTitle,
    'taskDescription': subtaskDescription,
    'taskStatus': subtaskStatus.name,
  };

  // toEntity conversion
  SubtaskEntity toEntity() {
    return SubtaskEntity(
      id: subtaskId,
      creationDate: subtaskCreationDate,
      deadline: subtaskDeadline,
      taskTitle: subtaskTitle,
      taskDescription: subtaskDescription,
      taskStatus: subtaskStatus,
    );
  }

  // fromEntity conversion
  factory SubtaskModel.fromEntity(SubtaskEntity entity) {
    return SubtaskModel(
      subtaskId: entity.id,
      subtaskCreationDate: entity.creationDate,
      subtaskDeadline: entity.deadline,
      subtaskTitle: entity.taskTitle,
      subtaskDescription: entity.taskDescription,
      subtaskStatus: entity.taskStatus,
    );
  }
}
