import 'dart:convert';
import 'dart:developer';

import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Core/error/custom_exception.dart';
import 'package:caffee/Core/helper/back_end_key.dart';
import 'package:caffee/Core/service/data_base_service.dart';
import 'package:caffee/Core/service/firebase_auth_service.dart';
import 'package:caffee/Core/service/shared_preferences.dart';
import 'package:caffee/Feature/Auth/data/user_model.dart';
import 'package:caffee/Feature/Auth/domain/user_repo.dart';
import 'package:caffee/Feature/Auth/domain/user_entity.dart';
import 'package:caffee/constance.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepoImpl extends UserRepo {
  final DataBaseService dataBaseService;
  final FireBaseAuthService fireBaseAuthService;

  UserRepoImpl({
    required this.dataBaseService,
    required this.fireBaseAuthService,
  });
  @override
  Future<Either<Failure, UserEntity>> createUserWithEmailAndPassword({
    required String name,
    required String email,
    required String password,
    required String number,
  }) async {
    User? user;
    try {
      user = await fireBaseAuthService.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      dataBaseService.addUser(
        path: BackEndPoint.addUsers,
        json: UserModel.fromUser(
          user: user,
          name: name,
          number: number,
        ).tojson(),
        documentId: user.uid,
      );
      UserEntity userEntity = UserModel.fromUser(
        user: user,
        name: name,
        number: number,
      ).toUSerEntity();

      return Right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      deleteUser(user);
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithEmailAndPasword({
    required String email,
    required String password,
  }) async {
    try {
      var user = await fireBaseAuthService.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      var json = await dataBaseService.getUser(
        path: BackEndPoint.getUsers,
        documentId: user.uid,
      );
      UserEntity userEntity = UserModel.fromJson(json).toUSerEntity();
      addUserToSharedPreferences(userEntity);
      return Right(userEntity);
    } catch (e) {
      return Left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithGoogle() async {
    try {
      UserCredential userCredintial = await fireBaseAuthService
          .signInWithGoogle();
      User user = userCredintial.user!;
      log('$user');
      UserModel userModel = UserModel.fromUser(
        user: user,
        name: user.displayName!,
        number: user.phoneNumber??'',
      );
      log('$userModel');
      dataBaseService.addUser(
        path: BackEndPoint.addUsers,
        json: userModel.tojson(),
      );
      UserEntity userEntity = userModel.toUSerEntity();
      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.error));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await fireBaseAuthService.deleteUser();
    }
  }

  void addUserToSharedPreferences(UserEntity user) async {
    var json = await jsonEncode(UserModel.fromUserEntity(user).tojson());
    SharedPreferencesSingleton.saveUSer(KUserData, json);
  }
}
