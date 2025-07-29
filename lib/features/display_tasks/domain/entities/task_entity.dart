// main task entity keeping attrbites like date of task creation, date of submission, title and description

import 'package:equatable/equatable.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/features/display_tasks/domain/entities/subtask_entity.dart';

class TaskEntity extends Equatable {
  final String id;
  final DateTime creationDate;
  final DateTime? deadline;
  final String taskTitle;
  final String? taskDescription;
  final TaskStatus? taskStatus;
  final bool? pinned;
  final List<SubtaskEntity> subtasks;

  const TaskEntity({
    required this.id,
    required this.creationDate,
    this.deadline,
    required this.taskTitle,
    this.taskDescription,
    this.taskStatus = TaskStatus.pending,
    this.pinned = false,
    this.subtasks = const <SubtaskEntity>[],
  });

  @override
  List<Object?> get props => [
    id,
    creationDate,
    deadline,
    taskTitle,
    taskDescription,
    taskStatus,
    pinned,
    subtasks,
  ];
}
