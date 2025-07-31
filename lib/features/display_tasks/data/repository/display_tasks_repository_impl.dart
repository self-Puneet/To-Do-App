import 'package:dartz/dartz.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/core/platform/network_info.dart';
import 'package:todo_app/features/display_tasks/data/datasource/display_task_local_data_source.dart';
import 'package:todo_app/features/display_tasks/data/datasource/display_task_remote_data_source.dart';
import 'package:todo_app/features/display_tasks/data/model/subtask_model.dart';
import 'package:todo_app/features/display_tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/display_tasks/domain/repositories/display_tasks_repository.dart';

class DisplayTasksRepositoryImpl implements DisplayTasksRepository {
  final DisplayTaskRemoteDataSource remoteDataSource;
  final DisplayTaskLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  DisplayTasksRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllPinnedTasks() async {
    if (await networkInfo.isConnected()) {
      try {
        final tasks = await remoteDataSource.getAllPinnedTasks();
        await localDataSource.cacheTasks(tasks);
        return Right(tasks);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final tasks = await localDataSource.getCachedTasks();
        return Right(tasks);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<SubtaskModel>>> getAllSubtasksByTaskId(
    String taskId,
  ) async {
    if (await networkInfo.isConnected()) {
      try {
        final subtasks = await remoteDataSource.getAllSubtasksByTaskId(taskId);
        localDataSource.cacheSubtasks(subtasks, taskId);
        return Right(subtasks);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final tasks = await localDataSource.getCachedSubtasks(taskId);
        return Right(tasks);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasks() async {
    if (await networkInfo.isConnected()) {
      try {
        final tasks = await remoteDataSource.getAllTasks();
        localDataSource.cacheTasks(tasks);
        return Right(tasks);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final tasks = await localDataSource.getCachedTasks();
        return Right(tasks);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<TaskEntity>>> getAllTasksByStatus(
    TaskStatus status,
  ) async {
    if (await networkInfo.isConnected()) {
      try {
        final tasks = await remoteDataSource.getAllTasksByStatus(status);
        localDataSource.cacheTasks(tasks);
        return Right(tasks);
      } catch (e) {
        return Left(ServerFailure());
      }
    } else {
      try {
        final tasks = await localDataSource.getCachedTasks();
        return Right(tasks);
      } catch (e) {
        return Left(CacheFailure());
      }
    }
  }
}
