import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/core/utils/typedef.dart';
import 'package:tdd/src/authentication/data/models/user_model.dart';
import 'package:tdd/src/authentication/domain/entities/user.dart';
import 'dart:io';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tModel = UserModel.empty();

  test('should be a sub class of user', () {
    // Arrange
    //Act
    expect(tModel, isA<User>());
  });

  final tJson = fixture('user.json');
  final tMap = jsonDecode(tJson) as DataMap;

  group('fromMap', () {
    test('should return a [UserModel] with the right data', () {
      final result = UserModel.fromJson(tJson);

      expect(result, equals(tModel));
    });
  });

  group('fromJson', () {
    test('should return a [UserModel] with the right data', () {
      final result = UserModel.fromMap(tMap);

      expect(result, equals(tModel));
    });
  });

  group('toMap', () {
    test('should return a DataMap with the right data', () {
      final result = tModel.toMap();

      expect(result, equals(tMap));
    });
  });

  group('toJson', () {
    test('should return a JSON with the right data', () {
      final exampleJson = jsonEncode({
        "id": "1",
        "avatar": '_empty.avatar',
        "createdAt": '_empty.createdAt',
        "name": '_empty.name',
      });

      final result = tModel.toJson();

      expect(result, equals(exampleJson));
    });
  });

  group('copyWith', () {
    test('Should return name with the name in new object', () {
      // Arrange
      final result = tModel.copyWith(name: 'Paul');

      // Assert
      expect(result.name, equals('Paul'));
    });
  });
}
