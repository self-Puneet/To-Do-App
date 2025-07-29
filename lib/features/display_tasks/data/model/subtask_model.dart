import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/features/display_tasks/domain/entities/subtask_entity.dart';

class SubtaskModel extends SubtaskEntity {
  const SubtaskModel({
    required String id,
    required DateTime creationDate,
    DateTime? deadline,
    required String taskTitle,
    String? taskDescription,
    required TaskStatus taskStatus,
  }) : super(
          id: id,
          creationDate: creationDate,
          deadline: deadline,
          taskTitle: taskTitle,
          taskDescription: taskDescription,
          taskStatus: taskStatus,
        );

  /// ✅ Deserialize from JSON
  factory SubtaskModel.fromJson(Map<String, dynamic> json) {
    return SubtaskModel(
      id: json['id'] as String,
      creationDate: DateTime.parse(json['creationDate']),
      deadline: json['deadline'] != null ? DateTime.parse(json['deadline']) : null,
      taskTitle: json['taskTitle'] as String,
      taskDescription: json['taskDescription'],
      taskStatus: TaskStatus.values.firstWhere(
        (e) => e.name == json['taskStatus'],
        orElse: () => TaskStatus.pending,
      ),
    );
  }

  /// ✅ Serialize to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'creationDate': creationDate.toIso8601String(),
      'deadline': deadline?.toIso8601String(),
      'taskTitle': taskTitle,
      'taskDescription': taskDescription,
      'taskStatus': taskStatus.name,
    };
  }
}
