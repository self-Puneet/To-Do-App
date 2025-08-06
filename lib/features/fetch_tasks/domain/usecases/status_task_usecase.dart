import 'package:dartz/dartz.dart';

import 'package:todo_app/core/base_usecase.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/fetch_tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/fetch_tasks/domain/repositories/display_tasks_repository.dart';

class GetTaskByStatusParams {
  final String username;
  final TaskStatus taskStatus;

  GetTaskByStatusParams({required this.username, required this.taskStatus});
}

class GetTaskByStatusUsecase
    extends BaseUseCase<List<TaskEntity>, GetTaskByStatusParams> {
  final FetchTasksRepository repository;

  GetTaskByStatusUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(
    GetTaskByStatusParams params,
  ) async {
    return await repository.getAllTasksByStatus(
      params.username,
      params.taskStatus,
    );
  }
}
