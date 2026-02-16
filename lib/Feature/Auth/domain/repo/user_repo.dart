import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Feature/Auth/domain/entity/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class UserRepo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String number,
  });
  Future<Either<Failure, UserEntity>> signInWithEmailAndPasword({
    required String email,
    required String password,
  });
  Future<Either<Failure, void>> updateUserData({required UserEntity userEntity});

  Future<Either<Failure, UserEntity>> signInWithGoogle();
  Future<Either<Failure, UserEntity>> signInWithFacebook();
  void addUserToSharedPreferences(UserEntity user);
  Future<void> deleteUser(User? user);
}
