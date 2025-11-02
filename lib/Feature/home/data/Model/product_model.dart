import 'package:caffee/Feature/home/data/Model/Review_model.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';

class ProductModel {
  final String imageUrl;
  final String productId;
  final String name;
  final String additional;
  final String details;
  final num rate;

  final num priceS;
  final num priceM;
  final num priceL;
  final List<ReviewModel> reviewModel;

  ProductModel({
    required this.imageUrl,

    required this.productId,
    required this.name,
    required this.additional,
    required this.details,
    required this.rate,

    required this.priceS,
    required this.priceM,
    required this.priceL,
    required this.reviewModel,
  });

Map<String, dynamic> toJson() {
    return {
      'imageUrl': imageUrl,
      'productId': productId,
      'name': name,
      'additional': additional,
      'details': details,
      'rate': rate,
      'priceS': priceS,
      'priceM': priceM,
      'priceL': priceL,
      'reviewEntity': reviewModel.map((e) {
        e.toJson();
      }).toList(),
    };
  }

  factory ProductModel.fromEntity(ProductEntity product) {
    return ProductModel(
      imageUrl: product.imageUrl,
      productId: product.productId,
      name: product.name,
      additional: product.additional,
      details: product.details,
      rate: product.rate,
      priceS: product.priceS,
      priceM: product.priceM,
      priceL: product.priceL,
      reviewModel:product.reviewEntity.map((e)=>ReviewModel.fromEntity(e)).toList(),
    );
  }

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      imageUrl: json['imageUrl'],
      productId: json['productId'],
      name: json['name'],
      additional: json['additional'],
      details: json['details'],
      rate: json['rate'],

      priceS: json['priceS'],
      priceM: json['priceM'],
      priceL: json['priceL'],

      reviewModel: List<ReviewModel>.from(
        json['reviewEntity']?.map((e) => ReviewModel.fromJson(e)),
      ),
    );
  }
  ProductEntity toEntity() {
    return ProductEntity(
      imageUrl: imageUrl,
      productId: productId,
      name: name,
      additional: additional,
      details: details,
      rate: rate,

      priceS: priceS,
      priceM: priceM,
      priceL: priceL,
      reviewEntity: reviewModel.map((e) => e.toEntity()).toList(),
    );
  }
}
