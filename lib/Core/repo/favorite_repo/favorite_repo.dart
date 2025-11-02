import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class FavoriteRepo {
  Stream<Either<Failure, List<ProductEntity>>> getFavoritesData();

  Future<Either<Failure, void>> addFavorite({
    required Map<String, dynamic> data,
    required String productId,
  });

  Future<Either<Failure, void>> deleteFavorite({required String productId});
}
