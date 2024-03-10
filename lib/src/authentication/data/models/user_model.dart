import 'dart:convert';
import 'dart:ffi';

import 'package:tdd/core/utils/typedef.dart';
import 'package:tdd/src/authentication/domain/entities/user.dart';

class UserModel extends User {
  const UserModel({
    required super.id,
    required super.name,
    required super.createdAt,
    required super.avatar,
  });

  const UserModel.empty()
      : this(
            id: "1",
            createdAt: '_empty.createdAt',
            name: '_empty.name',
            avatar: '_empty.avatar');

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(jsonDecode(source) as DataMap);

  UserModel.fromMap(DataMap map)
      : this(
          id: map['id'] as String,
          avatar: map['avatar'] as String,
          createdAt: map['createdAt'] as String,
          name: map['name'] as String,
        );

  UserModel copyWith({
    String? avatar,
    String? id,
    String? name,
    String? createdAt,
  }) {
    return UserModel(
        id: id ?? this.id,
        name: name ?? this.name,
        createdAt: createdAt ?? this.createdAt,
        avatar: avatar ?? this.avatar);
  }

  DataMap toMap() =>
      {'id': id, 'avatar': avatar, 'createdAt': createdAt, 'name': name};

  String toJson() => jsonEncode(toMap());
}
