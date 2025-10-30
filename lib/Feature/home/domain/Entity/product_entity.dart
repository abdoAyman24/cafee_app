import 'package:caffee/Feature/home/domain/Entity/review_entity.dart';

class ProductEntity {
  final String imageUrl;
  final String productId;
  final String name;
  final String additional;
  final String details;
  final num rate;

  final num priceS;
  final num priceM;
  final num priceL;

  final List<ReviewEntity> reviewEntity;

  ProductEntity({
    required this.imageUrl,
    required this.productId,
    required this.name,
    required this.additional,
    required this.details,
    required this.rate,
    required this.priceS,
    required this.priceM,
    required this.priceL,

    required this.reviewEntity,
  });
}
