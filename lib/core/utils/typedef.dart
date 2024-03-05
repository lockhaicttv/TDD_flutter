import 'package:dartz/dartz.dart';
import 'package:tdd/core/errors/failure.dart';

typedef ResultFuture<T> = Future<Either<Failure, T>>;

typedef ResultFutureVoid = ResultFuture<void>;
