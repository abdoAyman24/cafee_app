import 'package:caffee/Feature/home/domain/Entity/review_entity.dart';

class ProductEntity {
  final String productId;
  final String name;
  final String additional;
  final String details;
  final num rate;
  final bool isFavorite;
  final num price;
  final List<ReviewEntity> reviewEntity;

  ProductEntity({required this.productId, required this.name, required this.additional, required this.details, required this.rate, required this.isFavorite, required this.price, required this.reviewEntity});



}
