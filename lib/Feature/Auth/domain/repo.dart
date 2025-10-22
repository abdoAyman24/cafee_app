import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Feature/Auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';

abstract class Repo {
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required int number,
  });
  Future<Either<Failure, UserEntity>> signInWithEmailAndPasword({required String email,required String password});
}
