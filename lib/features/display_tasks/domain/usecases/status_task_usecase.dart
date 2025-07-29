import 'package:dartz/dartz.dart';

import 'package:todo_app/core/base_usecase.dart';
import 'package:todo_app/core/enums/task_status.dart';
import 'package:todo_app/core/errors/failure.dart';
import 'package:todo_app/features/display_tasks/domain/entities/task_entity.dart';
import 'package:todo_app/features/display_tasks/domain/repositories/display_tasks_repository.dart';

class GetTaskByStatusUsecase extends BaseUseCase<List<TaskEntity>, TaskStatus>{
  final DisplayTasksRepository repository;

  GetTaskByStatusUsecase(this.repository);

  @override
  Future<Either<Failure, List<TaskEntity>>> call(TaskStatus status) async {
    return await repository.getAllTasksByStatus(status);
  }
}
