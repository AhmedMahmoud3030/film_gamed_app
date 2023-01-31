import 'package:dartz/dartz.dart';
import 'package:film_gamed_app/core/error/failure.dart';
import 'package:film_gamed_app/movie/domain/entities/movie.dart';

abstract class BaseUseCase<T> {
  Future<Either<Failure, T>> call();
}
