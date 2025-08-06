import 'package:dartz/dartz.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/core/platform/network_info.dart';
import 'package:todo_app/features/fetch_tasks/data/datasource/fetch_task_local_data_source.dart';
import 'package:todo_app/features/fetch_tasks/data/datasource/fetch_task_remote_data_source.dart';
import 'package:todo_app/features/fetch_tasks/domain/entities/subtask_entity.dart';
import 'package:todo_app/features/fetch_tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/fetch_tasks/domain/repositories/display_tasks_repository.dart';

class FetchTasksRepositoryImpl implements FetchTasksRepository {
  final FetchTaskRemoteDataSource remoteDataSource;
  final FetchTaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  FetchTasksRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllPinnedTasks(
    String username,
  ) async {
    if (await networkInfo.isConnected()) {
      try {
        final tasks = await remoteDataSource.getAllPinnedTasks(username);
        await localDataSource.cacheTasks(tasks);
        final taskEntities = tasks.map((model) => model.toEntity()).toList();
        return Right(taskEntities);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final tasks = await localDataSource.getCachedTasks();
        final taskEntities = tasks.map((model) => model.toEntity()).toList();
        return Right(taskEntities);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<SubtaskEntity>>> getAllSubtasksByTaskId(
    String username,
    String taskId,
  ) async {
    if (await networkInfo.isConnected()) {
      try {
        final subtasks = await remoteDataSource.getAllSubtasksByTaskId(
          username,
          taskId,
        );
        localDataSource.cacheSubtasks(subtasks, taskId);
        final subtaskEntities = subtasks
            .map((model) => model.toEntity())
            .toList();
        return Right(subtaskEntities);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final tasks = await localDataSource.getCachedSubtasks(taskId);
        final subtaskEntities = tasks.map((model) => model.toEntity()).toList();
        return Right(subtaskEntities);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks(String username) async {
    if (await networkInfo.isConnected()) {
      try {
        final tasks = await remoteDataSource.getAllTasks(username);
        localDataSource.cacheTasks(tasks);
        final finalTasks = tasks.map((model) => model.toEntity()).toList();
        return Right(finalTasks);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final tasks = await localDataSource.getCachedTasks();
        final finalTasks = tasks.map((model) => model.toEntity()).toList();
        return Right(finalTasks);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasksByStatus(
    String username,
    TaskStatus status,
  ) async {
    if (await networkInfo.isConnected()) {
      try {
        final tasks = await remoteDataSource.getAllTasksByStatus(
          username,
          status,
        );
        localDataSource.cacheTasks(tasks);
        final finalTasks = tasks.map((model) => model.toEntity()).toList();
        return Right(finalTasks);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final tasks = await localDataSource.getCachedTasks();
        final finalTasks = tasks.map((model) => model.toEntity()).toList();
        return Right(finalTasks);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }
}
