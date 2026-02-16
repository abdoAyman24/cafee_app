import 'dart:convert';
import 'dart:developer';

import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Core/error/custom_exception.dart';
import 'package:caffee/Core/error/custom_fire_base_excption.dart';
import 'package:caffee/Core/helper/back_end_key.dart';
import 'package:caffee/Core/helper/cache_helper.dart';
import 'package:caffee/Core/service/data_base_service.dart';
import 'package:caffee/Core/service/firebase_auth_service.dart';
import 'package:caffee/Core/service/shared_preferences.dart';
import 'package:caffee/Core/service/stripe_service/stripe_service.dart';
import 'package:caffee/Feature/Auth/data/model/user_model.dart';
import 'package:caffee/Feature/Auth/domain/repo/user_repo.dart';
import 'package:caffee/Feature/Auth/domain/entity/user_entity.dart';
import 'package:caffee/Feature/payment/data/model/stripe_model/customer_model/customer_model.dart';
import 'package:caffee/constance.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

class UserRepoImpl extends UserRepo {
  final DataBaseService dataBaseService;
  final FireBaseAuthService fireBaseAuthService;
  final StripeService stripeService;

  UserRepoImpl({
    required this.dataBaseService,
    required this.fireBaseAuthService,
    required this.stripeService,
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

      CustomerModel customerModel = await stripeService.createCustomerId(
        name: name,
        email: email,
        number: number,
      );

      dataBaseService.addUser(
        path: BackEndPoint.addUsers,
        json: UserModel.fromUser(
          id: user.uid,
          email: user.email!,
          name: name,
          number: number,
          customerId: customerModel.id ?? '',
        ).toJson(),
        documentId: user.uid,
      );
      UserEntity userEntity = UserModel.fromUser(
        id: user.uid,
        email: user.email!,
        name: name,
        number: number,
        customerId: customerModel.id ?? '',
      ).toUSerEntity();

      return Right(userEntity);
    } on CustomException catch (e) {
      deleteUser(user);
      log(e.toString());
      return Left(ServerFailure(message: e.toString()));
    } catch (e) {
      log(e.toString());

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
      var json = await dataBaseService.getData(
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

      CustomerModel customerModel = await stripeService.createCustomerId(
        name: user.displayName ?? 'None',
        email: user.email ?? 'none',
        number: user.phoneNumber ?? '',
      );
      UserModel userModel = UserModel.fromUser(
        id: user.uid,
        email: user.email!,
        name: user.displayName!,
        number: user.phoneNumber ?? 'None',
        customerId: customerModel.id ?? 'None',
      );
      dataBaseService.addUser(
        path: BackEndPoint.addUsers,
        json: userModel.toJson(),
      );
      UserEntity userEntity = userModel.toUSerEntity();
      addUserToSharedPreferences(userEntity);
      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.error));
    } catch (e) {
      return left(ServerFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, UserEntity>> signInWithFacebook() async {
    try {
      log('Start signIn with facebook');
      UserCredential userCredintial = await fireBaseAuthService
          .signInWithFacebook();
      log('1 step signIn with facebook');

      final user = userCredintial.user;
      if (user == null) {
        return left(
          ServerFailure(message: 'Facebook login failed: no user returned.'),
        );
      }
      CustomerModel customerModel = await stripeService.createCustomerId(
        name: user.displayName ?? 'None',
        email: user.email ?? 'none',
        number: user.phoneNumber ?? '',
      );
      UserModel userModel = UserModel.fromUser(
        id: user.uid,
        email: user.emailVerified ? user.email! : 'not found',
        name: user.displayName!,
        number: user.phoneNumber ?? '',
        customerId: customerModel.id ?? '',
      );

      dataBaseService.addUser(
        path: BackEndPoint.addUsers,
        json: userModel.toJson(),
      );

      UserEntity userEntity = userModel.toUSerEntity();
      return Right(userEntity);
    } on CustomException catch (e) {
      return left(ServerFailure(message: e.error));
    } catch (e) {
      log('error signIn with facebook');

      return left(ServerFailure(message: e.toString()));
    }
  }

  Future<void> deleteUser(User? user) async {
    if (user != null) {
      await fireBaseAuthService.deleteUser();
    }
  }

  @override
  void addUserToSharedPreferences(UserEntity user) async {
    var json = await jsonEncode(UserModel.fromUserEntity(user).toJson());
    SharedPreferencesSingleton.saveUSer(KUserData, json);
  }
   @override
  Future<Either<Failure, void>> updateUserData({
    required UserEntity userEntity,
  }) async {
    try {
      UserModel userModel = UserModel.fromEntity(userEntity);
      await dataBaseService.updateData(
        path: BackEndPoint.addUsers,
        json: userModel.toJson(),
        documentId: userEntity.id,
      );

      CacheHelper.saveData(key: KUserData, value: jsonEncode(userModel.toJson()));

      return right(null);
    } on CustomFireBaseExcption catch (e) {
      return left(
        ServerFailure(message: e.errorMessage, ),
      );
    }
  }
}
