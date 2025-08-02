// make abstract class containing same functions as there are in the contract repository

import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/errors/exceptions.dart';
import 'package:todo_app/features/display_tasks/data/model/subtask_model.dart';
import 'package:todo_app/features/display_tasks/data/model/task_model.dart';
import 'package:http/http.dart' as http;

abstract class DisplayTaskRemoteDataSource {
  Future<List<TaskModel>> getAllTasks();
  Future<List<TaskModel>> getAllPinnedTasks();
  Future<List<TaskModel>> getAllTasksByStatus(TaskStatus status);
  Future<List<SubtaskModel>> getAllSubtasksByTaskId(String taskId);
}

class DisplayTaskRemoteDataSourceImpl implements DisplayTaskRemoteDataSource {
  final http.Client client;

  DisplayTaskRemoteDataSourceImpl({required this.client});

  @override
  Future<List<TaskModel>> getAllTasks() {
    try {
      final jsonResponse = [
        {
          'id': '1',
          'creationDate': DateTime.now().toIso8601String(),
          'deadline': null,
          'taskTitle': 'Sample Task',
          'taskDescription': 'This is a sample task description.',
          'taskStatus': TaskStatus.pending.name,
          'pinned': false,
          'subtasks': [],
        },
        {
          'id': '2',
          'creationDate': DateTime.now().toIso8601String(),
          'deadline': DateTime.now().add(Duration(days: 2)).toIso8601String(),
          'taskTitle': 'Another Task',
          'taskDescription': 'This is another task description.',
          'taskStatus': TaskStatus.completed.name,
          'pinned': true,
        },
      ];
      return Future.value(
        jsonResponse.map((json) => TaskModel.fromJson(json)).toList(),
      );
    } catch (e) {
      throw ServerException('Failed to fetch tasks: $e');
    }
  }

  @override
  Future<List<TaskModel>> getAllPinnedTasks() {
    try {
      final jsonResponse = [
        {
          'id': '1',
          'creationDate': DateTime.now().toIso8601String(),
          'deadline': null,
          'taskTitle': 'Sample Task',
          'taskDescription': 'This is a sample task description.',
          'taskStatus': TaskStatus.pending.name,
          'pinned': true,
          'subtasks': [],
        },
        {
          'id': '2',
          'creationDate': DateTime.now().toIso8601String(),
          'deadline': DateTime.now().add(Duration(days: 2)).toIso8601String(),
          'taskTitle': 'Another Task',
          'taskDescription': 'This is another task description.',
          'taskStatus': TaskStatus.completed.name,
          'pinned': true,
        },
      ];
      return Future.value(
        jsonResponse.map((json) => TaskModel.fromJson(json)).toList(),
      );
    } catch (e) {
      throw ServerException('Failed to fetch tasks: $e');
    }
  }

  @override
  Future<List<TaskModel>> getAllTasksByStatus(TaskStatus status) {
    try {
      final jsonResponse = [
        {
          'id': '1',
          'creationDate': DateTime.now().toIso8601String(),
          'deadline': null,
          'taskTitle': 'Sample Task',
          'taskDescription': 'This is a sample task description.',
          'taskStatus': status.name,
          'pinned': false,
          'subtasks': [],
        },
      ];
      return Future.value(
        jsonResponse.map((json) => TaskModel.fromJson(json)).toList(),
      );
    } catch (e) {
      throw ServerException('Failed to fetch tasks by status: $e');
    }
  }

  @override
  Future<List<SubtaskModel>> getAllSubtasksByTaskId(String taskId) {
    try {
      final jsonResponse = [
        {
          'subtaskId': taskId,
          'subtaskTitle': 'Subtask 1',
          'subtaskStatus': TaskStatus.pending.name,
        },
        {
          'subtaskId': taskId,
          'subtaskTitle': 'Subtask 2',
          'subtaskStatus': TaskStatus.completed.name,
        }
      ];
      return Future.value(
        jsonResponse.map((json) => SubtaskModel.fromJson(json)).toList(),
      );
    } catch (e) {
      throw ServerException('Failed to fetch subtasks: $e');
    }
  }
}
