import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/features/display_tasks/data/model/subtask_model.dart';
import 'package:todo_app/features/display_tasks/domain/entities/task_entity.dart';
import 'package:hive/hive.dart';

part 'task_model.g.dart';

@HiveType(typeId: 2)
class TaskModel {
  @HiveField(0)
  final String id;
  @HiveField(1)
  final DateTime creationDate;
  @HiveField(2)
  final DateTime? deadline;
  @HiveField(3)
  final String taskTitle;
  @HiveField(4)
  final String? taskDescription;
  @HiveField(5)
  final TaskStatus? taskStatus;
  @HiveField(6)
  final bool pinned;
  @HiveField(7)
  final List<SubtaskModel> subtasks;

  TaskModel({
    required this.id,
    required this.creationDate,
    this.deadline,
    required this.taskTitle,
    this.taskDescription,
    this.taskStatus = TaskStatus.pending,
    this.pinned = false,
    this.subtasks = const [],
  });

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      creationDate: DateTime.parse(json['creationDate']),
      deadline: json['deadline'] != null
          ? DateTime.parse(json['deadline'])
          : null,
      taskTitle: json['taskTitle'] ?? '',
      taskDescription: json['taskDescription'],
      taskStatus: json['taskStatus'] != null
          ? TaskStatus.values.firstWhere(
              (e) => e.name == json['taskStatus'],
              orElse: () => TaskStatus.pending,
            )
          : TaskStatus.pending,
      pinned: json['pinned'] ?? false,
      subtasks: (json['subtasks'] as List<dynamic>? ?? [])
          .map((e) => SubtaskModel.fromJson(e))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate.toIso8601String(),
      'deadline': deadline?.toIso8601String(),
      'taskTitle': taskTitle,
      'taskDescription': taskDescription,
      'taskStatus': taskStatus?.name,
      'pinned': pinned,
      'subtasks': subtasks.map((e) => e.toJson()).toList(),
    };
  }

  // toEntity conversion
  TaskEntity toEntity() {
    return TaskEntity(
      id: id,
      creationDate: creationDate,
      deadline: deadline,
      taskTitle: taskTitle,
      taskDescription: taskDescription,
      taskStatus: taskStatus,
      pinned: pinned,
      subtasks: subtasks.map((e) => e.toEntity()).toList(),
    );
  }

  // from entity conversion
  factory TaskModel.fromEntity(TaskEntity entity) {
    return TaskModel(
      id: entity.id,
      creationDate: entity.creationDate,
      deadline: entity.deadline,
      taskTitle: entity.taskTitle,
      taskDescription: entity.taskDescription,
      taskStatus: entity.taskStatus,
      pinned: entity.pinned ?? false,
      subtasks: entity.subtasks.map((e) => SubtaskModel.fromEntity(e)).toList(),
    );
  }
}
