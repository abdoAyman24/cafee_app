import 'package:caffee/Core/error/auth_faluire_service.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:dartz/dartz.dart';

abstract class ProductRepo {
  Future<Either<Failure, List<ProductEntity>>> getProduct();
}
