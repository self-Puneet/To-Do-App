// make abstract class containing same functions as there are in the contract repository

import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/features/display_tasks/data/model/task_model.dart';

abstract class DisplayTaskRemoteDataSource {
  Future<List<TaskModel>> getAllTasks();
  Future<List<TaskModel>> getAllPinnedTasks();
  Future<List<TaskModel>> getAllTasksByStatus(TaskStatus status);
  Future<List<TaskModel>> getAllSubtasksByTaskId(String taskId);
} 