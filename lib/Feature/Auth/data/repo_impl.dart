import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Core/service/data_base_service.dart';
import 'package:caffee/Core/service/firebase_auth_service.dart';
import 'package:caffee/Feature/Auth/data/user_model.dart';
import 'package:caffee/Feature/Auth/domain/repo.dart';
import 'package:caffee/Feature/Auth/domain/user_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RepoImpl extends Repo {
  final DataBaseService dataBaseService;
  final FireBaseAuthService fireBaseAuthService;

  RepoImpl({required this.dataBaseService, required this.fireBaseAuthService});
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required int number,
  }) async {
    try {
      User user = await fireBaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      UserEntity userEntity = UserModel.fromUser(
        user: user,
        name: name,
        number: number,
      ).toUSerEntity();

      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPasword({
    required String email,
    required String password,
  }) {
    // TODO: implement signInWithEmailAndPasword
    throw UnimplementedError();
  }
}
