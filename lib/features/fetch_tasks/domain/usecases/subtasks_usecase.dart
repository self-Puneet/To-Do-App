import 'package:dartz/dartz.dart';
import 'package:todo_app/core/base_usecase.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/fetch_tasks/domain/entities/subtask_entity.dart';
import 'package:todo_app/features/fetch_tasks/domain/repositories/display_tasks_repository.dart';

class GetSubtaskByTaskParams {
  final String username;
  final String taskId;

  GetSubtaskByTaskParams({required this.username, required this.taskId});
}

class GetSubtaskByTaskUsecase
    extends BaseUseCase<List<SubtaskEntity>, GetSubtaskByTaskParams> {
  final FetchTasksRepository repository;

  GetSubtaskByTaskUsecase(this.repository);

  @override
  Future<Either<Failure, List<SubtaskEntity>>> call(
    GetSubtaskByTaskParams params,
  ) async {
    return await repository.getAllSubtasksByTaskId(
      params.username,
      params.taskId,
    );
  }
}
