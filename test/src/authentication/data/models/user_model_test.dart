import 'package:flutter_test/flutter_test.dart';
import 'package:tdd/src/authentication/data/models/user_model.dart';
import 'package:tdd/src/authentication/domain/entities/user.dart';
import 'dart:io';

void main() {
  const tModel = UserModel.empty();

  test('should be a sub class of user', () {
    // Arrange
    //Act
    expect(tModel, isA<User>());
  });
  
  group('fromMap', () {
    test('should return a [UserModel] with the right data', () => {
      final tJson = File('test/fixtures/user.json').readAsStringSync();
      print(tJson)
    });
  });
}
