import 'package:caffee/Feature/Auth/domain/user_entity.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String name;
  final String email;
  final String number;

  UserModel({required this.name, required this.email, required this.number});

  factory UserModel.fromUserEntity(UserEntity userEntity) {
    return UserModel(
      name: userEntity.name,
      email: userEntity.email,
      number: userEntity.number,
    );
  }
  UserEntity toUSerEntity() {
    return UserEntity(name: name, email: email, number: number);
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      name: json['name'],
      email: json['email'],
      number: json['number'],
    );
  }
  factory UserModel.fromUser({
    required User user,
    required String name,
    required String number,
  }) {
    return UserModel(
      name: name,
      email: user.email!,
      number: number,
    );
  }
  Map<String, dynamic> tojson() {
    return {'name': name, 'email': email, 'number': number};
  }
}
