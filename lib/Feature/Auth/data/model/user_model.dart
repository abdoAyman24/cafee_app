import 'package:caffee/Feature/Auth/domain/entity/user_entity.dart';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String number;
  //Custom id for paypal payment
  final String customerId;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.number,
    required this.customerId,
  });

  factory UserModel.fromUserEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
      number: userEntity.number,
      customerId: userEntity.customerId,
    );
  }
  UserEntity toUSerEntity() {
    return UserEntity(
      id: id,
      name: name,
      email: email,
      number: number,
      customerId: customerId,
    );
  }

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      number: json['number'],
      customerId: json['customerId'],
    );
  }
  Map<String, dynamic> toCreateCustomerId() {
    return {'name': name, 'email': email, 'phone': number};
  }

  factory UserModel.fromEntity(UserEntity userEntity) {
    return UserModel(
      id: userEntity.id,
      name: userEntity.name,
      email: userEntity.email,
      number: userEntity.number,
      customerId: userEntity.customerId,
    );
  }
  factory UserModel.fromUser({
    required String id,
    required String email,
    required String name,
    required String number,
    required String customerId,
  }) {
    return UserModel(
      id: id,
      name: name,
      email: email,
      number: number,
      customerId: customerId,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'number': number,
      'customerId': customerId,
    };
  }
}
