// repository which will contain abstract class and will have these functions -
// 1. get all tasks
// 2. get all the subtasks of a task
// 3. get all pinned tasks
// 4. get all archived tasks

import 'package:dartz/dartz.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/display_tasks/domain/entities/subtask_entity.dart';
import 'package:todo_app/features/display_tasks/domain/entities/task_entity.dart';

abstract class DisplayTasksRepository {
  Future<Either<Failure, List<TaskEntity>>> getAllTasks();
  Future<Either<Failure, List<TaskEntity>>> getAllPinnedTasks();
  Future<Either<Failure, List<TaskEntity>>> getAllTasksByStatus(TaskStatus status);
  Future<Either<Failure, List<SubtaskEntity>>> getAllSubtasksByTaskId(String taskId);
}
