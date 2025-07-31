  import 'package:hive/hive.dart';
  import 'package:todo_app/features/display_tasks/data/model/subtask_model.dart';
  import 'package:todo_app/features/display_tasks/data/model/task_model.dart';

  abstract class DisplayTaskLocalDataSource {
    Future<List<TaskModel>> getCachedTasks();
    Future<List<SubtaskModel>> getCachedSubtasks(String id);
    Future<void> cacheTasks(List<TaskModel> tasks);
    Future<void> cacheSubtasks(List<SubtaskModel> subtasks, String id);
  }


  class DisplayTaskLocalDataSourceImpl implements DisplayTaskLocalDataSource {
    final Box<TaskModel> taskBox;
    final Box<SubtaskModel> subtaskBox;

    DisplayTaskLocalDataSourceImpl({required this.taskBox, required this.subtaskBox});

    @override
    Future<List<TaskModel>> getCachedTasks() async {
      return taskBox.values.toList();
    }

    @override
    Future<List<SubtaskModel>> getCachedSubtasks(String id) async {
      return subtaskBox.values.where((subtask) => subtask.subtaskId == id).toList();
    }

    @override
    Future<void> cacheTasks(List<TaskModel> tasks) async {
      for (var task in tasks) {
        await taskBox.put(task.id, task);
      }
    }

    @override
    Future<void> cacheSubtasks(List<SubtaskModel> subtasks, String id) async {
      for (var subtask in subtasks) {
        await subtaskBox.put(subtask.subtaskId, subtask);
      }
    }
  }