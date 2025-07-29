import 'package:dartz/dartz.dart';
import 'package:todo_app/core/errors/failure.dart';

abstract class BaseUseCase<T, Params> {
  Future<Either<Failure, T>> call(Params params);
}