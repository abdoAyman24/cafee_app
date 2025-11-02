import 'dart:developer';

import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Core/helper/get_user_data.dart';
import 'package:caffee/Core/repo/favorite_repo/favorite_repo.dart';
import 'package:caffee/Core/service/data_base_service.dart';
import 'package:caffee/Feature/home/data/Model/product_model.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/constance.dart';
import 'package:dartz/dartz.dart';

class FavoriteRepoImpl implements FavoriteRepo {
  final DataBaseService dataBaseService;

  FavoriteRepoImpl({required this.dataBaseService});
  @override
  Future<Either<Failure, void>> addFavorite({
    required Map<String, dynamic> data,
    required productId,
  }) async {
    try {
      await dataBaseService.addFavoriteData(
        path: KFavoriteUser,
        userId: getUser().id,
        productId: productId,
        data: data,
      );
      return Right(null);
    } catch (e) {
      log(e.toString());
      return Left(ServerFailure(message: 'error When Add To Favorite'));
    }
  }

  @override
  Future<Either<Failure, void>> deleteFavorite({
    required String productId,
  }) async {
    try {
      await dataBaseService.deleteData(
        path: KFavoriteUser,
        userId: getUser().id,
        productId: productId,
      );
      return Right(null);
    } catch (e) {
      log(e.toString());

      return Left(
        ServerFailure(message: 'Error When Delete product from Favorite'),
      );
    }
  }

  @override
  Stream<Either<Failure, List<ProductEntity>>> getFavoritesData() async* {
    try {
      await for (var data in dataBaseService.getStremData(
        path: KFavoriteUser,
        userId: getUser().id,
      )) {
        List<ProductModel> productModel = List<ProductModel>.from(
          data.map((e) => ProductModel.fromJson(e)),
        );
        List<ProductEntity> entity = productModel
            .map((e) => e.toEntity())
            .toList();
        yield Right(entity);
      }
    } catch (e) {
      log(e.toString());
      yield Left(ServerFailure(message: e.toString()));
    }
  }
}
