import 'package:tdd/core/utils/typedef.dart';
import 'package:tdd/src/authentication/data/datasource/authentication_remote_data_source.dart';
import 'package:tdd/src/authentication/domain/entities/user.dart';
import 'package:tdd/src/authentication/domain/repositories/authentication_repository.dart';

class AuthenticationRepositoryImplementation extends AuthenticationRepository {
  const AuthenticationRepositoryImplementation(this._remoteDatasource);
  final AuthenticationRemoteDataSource _remoteDatasource;

  @override
  ResultFutureVoid createUser(
      {required String createdAt,
      required String name,
      required String avatar}) {
    // TODO: implement createUser
    throw UnimplementedError();
  }

  @override
  ResultFuture<List<User>> getUsers() {
    // TODO: implement getUsers
    throw UnimplementedError();
  }
}
