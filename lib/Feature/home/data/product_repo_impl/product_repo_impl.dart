import 'dart:developer';

import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Core/helper/back_end_key.dart';
import 'package:caffee/Core/service/data_base_service.dart';
import 'package:caffee/Feature/home/data/Model/product_model.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Feature/home/domain/product_repo/product_repo.dart';
import 'package:dartz/dartz.dart';

class ProductRepoImpl implements ProductRepo {
  final DataBaseService dataBaseService;

  ProductRepoImpl({required this.dataBaseService});

  @override
  Future<Either<Failure, List<ProductEntity>>> getProduct() async {
    try {
      var data =
          await dataBaseService.getData(path: BackEndPoint.getProducts)
              as List<Map<String, dynamic>>;
     
      List<ProductModel> productModel = data
          .map((e) => ProductModel.fromJson(e))
          .toList();
      List<ProductEntity> products = productModel
          .map((e) => e.toEntity())
          .toList();
      return Right(products);
    } catch (e) {
      log('${e.toString()}');
      return Left(ServerFailure(message: 'error when get Products'));
    }
  }
}
