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
          createAt: params.createAt, name: params.name, avatar: params.avatar);
}

class CreateUserParams extends Equatable {
  const CreateUserParams(this.createAt, this.name, this.avatar);

  final String createAt;
  final String name;
  final String avatar;

  @override
  List<Object?> get props => [name, createAt, avatar];
}
