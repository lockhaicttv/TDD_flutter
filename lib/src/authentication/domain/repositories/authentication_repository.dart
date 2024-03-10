import 'package:equatable/equatable.dart';
import 'package:tdd/core/utils/typedef.dart';

import '../entities/user.dart';

abstract class AuthenticationRepository {
  const AuthenticationRepository();

  ResultFutureVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar});

  ResultFuture<List<User>> getUsers();
}
