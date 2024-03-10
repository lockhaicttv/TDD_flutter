import 'package:equatable/equatable.dart';
import 'package:tdd/core/usesecase/usecase.dart';
import 'package:tdd/src/authentication/domain/repositories/authentication_repository.dart';

import 'package:tdd/core/utils/typedef.dart';

class CreateUser extends UseCaseWithParams<void, CreateUserParams> {
  const CreateUser(this._repository);

  final AuthenticationRepository _repository;

  @override
  ResultFutureVoid call(CreateUserParams params) async =>
      _repository.createUser(
          createdAt: params.createdAt,
          name: params.name,
          avatar: params.avatar);
}

class CreateUserParams extends Equatable {
  const CreateUserParams(
      {required this.createdAt, required this.name, required this.avatar});

  const CreateUserParams.empty()
      : this(
            createdAt: '_empty.createdAt',
            avatar: '_empty.avatar',
            name: '_empty.name');

  final String createdAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [name, createdAt, avatar];
}
