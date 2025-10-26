import 'package:caffee/Feature/home/data/Review_model.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';

class ProductModel {
  final String productId;
  final String name;
  final String additional;
  final String details;
  final num rate;
  final bool isFavorite;
  final num price;
  final List<ReviewModel> reviewModel;

  ProductModel({
    required this.productId,
    required this.name,
    required this.additional,
    required this.details,
    required this.rate,
    required this.isFavorite,
    required this.price,
    required this.reviewModel,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      productId: json['productId'],
      name: json['name'],
      additional: json['additional'],
      details: json['details'],
      rate: json['rate'],
      isFavorite: json['isFavorite'],
      price: json['price'],
      reviewModel: json['reviewEntity'],
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      productId: productId,
      name: name,
      additional: additional,
      details: details,
      rate: rate,
      isFavorite: isFavorite,
      price: price,
      reviewEntity:reviewModel.map((e)=>e.toEntity()).toList(),
    );
  }
}
