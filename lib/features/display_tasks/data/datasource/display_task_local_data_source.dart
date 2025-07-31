// create a abstract class which should contain 2 functions - getcached tasks and cache the fetched taks. nomenclature should be appropriate
import 'package:todo_app/features/display_tasks/data/model/subtask_model.dart';
import 'package:todo_app/features/display_tasks/data/model/task_model.dart';

abstract class DisplayTaskLocalDataSource {
  Future<List<TaskModel>> getCachedTasks();
  Future<List<SubtaskModel>> getCachedSubtasks(String id);
  Future<void> cacheTasks(List<TaskModel> tasks);
  Future<void> cacheSubtasks(List<SubtaskModel> subtasks, String id);
}
