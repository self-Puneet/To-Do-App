import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/features/display_tasks/data/model/subtask_model.dart';
import 'package:todo_app/features/display_tasks/domain/entities/task_entity.dart';

class TaskModel extends TaskEntity {
  TaskModel({
    required String id,
    required DateTime creationDate,
    DateTime? deadline,
    required String taskTitle,
    String? taskDescription,
    TaskStatus? taskStatus = TaskStatus.pending,
    bool? pinned = false,
    List<SubtaskModel> subtasks = const [],
  }) : super(
          id: id,
          creationDate: creationDate,
          deadline: deadline,
          taskTitle: taskTitle,
          taskDescription: taskDescription,
          taskStatus: taskStatus,
          pinned: pinned,
          subtasks: subtasks,
        );

  factory TaskModel.fromJson(Map<String, dynamic> json) {
    return TaskModel(
      id: json['id'] as String,
      creationDate: DateTime.parse(json['creationDate']),
      deadline: json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
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
      'subtasks': subtasks.map((e) => (e as SubtaskModel).toJson()).toList(),
    };
  }
}
