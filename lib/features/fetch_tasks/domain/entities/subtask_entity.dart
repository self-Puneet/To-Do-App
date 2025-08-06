// main task entity keeping attrbites like date of task creation, date of submission, title and description

import 'package:equatable/equatable.dart';
import 'package:todo_app/core/enums/task_status.dart';

class SubtaskEntity extends Equatable {
  final String id;
  final DateTime creationDate;
  final DateTime? deadline;
  final String taskTitle;
  final String? taskDescription;
  final TaskStatus taskStatus;

  const SubtaskEntity({
    required this.id,
    required this.creationDate,
    this.deadline,
    required this.taskTitle,
    this.taskDescription,
    required this.taskStatus,
  });

  @override
  List<Object?> get props => [
    id,
    creationDate,
    deadline,
    taskTitle,
    taskDescription,
    taskStatus,
  ];
}
