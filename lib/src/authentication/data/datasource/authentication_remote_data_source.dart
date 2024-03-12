import 'dart:convert';

import 'package:tdd/core/errors/exceptions.dart';
import 'package:tdd/core/utils/constants.dart';
import 'package:tdd/core/utils/typedef.dart';
import 'package:tdd/src/authentication/data/models/user_model.dart';
import 'package:http/http.dart' as http;

abstract class AuthenticationRemoteDataSource {
  Future<void> createUser({required String createdAt,
    required String name,
    required String avatar});

  Future<List<UserModel>> getUsers();
}

const kCreateUserEndPoint = '/test-api/users';
const kGetUserEndPoint = '/test-api/user';

class AuthRemoteDataSrcImp implements AuthenticationRemoteDataSource {
  const AuthRemoteDataSrcImp(this._client);

  final http.Client _client;

  @override
  Future<void> createUser({required String createdAt,
    required String name,
    required String avatar}) async {
    try {
      final response = await _client.post(
          Uri.https(kBaseUrl, kCreateUserEndPoint),
          body: jsonEncode(
              {'createdAt': 'createdAt', 'name': name, avatar: avatar}));

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }

  @override
  Future<List<UserModel>> getUsers() async {
    try {
      final response = await _client.get(Uri.https(kBaseUrl, kGetUserEndPoint));

      if (response.statusCode != 200) {
        throw APIException(
            message: response.body, statusCode: response.statusCode);
      }
      return List<DataMap>.from(jsonDecode(response.body) as List)
          .map((userData) => UserModel.fromMap(userData))
          .toList();
    } on APIException {
      rethrow;
    } catch (e) {
      throw APIException(message: e.toString(), statusCode: 505);
    }
  }
