import 'package:dartz/dartz.dart';
import 'package:todo_app/core/base_usecase.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/display_tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/display_tasks/domain/repositories/display_tasks_repository.dart';
class GetSubtaskByTaskUsecase extends BaseUseCase<List<TaskEntity>, String> {
  final DisplayTasksRepository repository;

  GetSubtaskByTaskUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(String taskId) async {
    return await repository.getAllSubtasksByTaskId(taskId);
  }
}
