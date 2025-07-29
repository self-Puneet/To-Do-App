import 'package:dartz/dartz.dart';
import 'package:todo_app/core/base_usecase.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/display_tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/display_tasks/domain/repositories/display_tasks_repository.dart';

class GetAllTasksUsecase extends BaseUseCase<List<TaskEntity>, void> {
  final DisplayTasksRepository repository;

  GetAllTasksUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(void params) async {
    return await repository.getAllTasks();
  }
}
