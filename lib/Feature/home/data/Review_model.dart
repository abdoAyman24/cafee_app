import 'package:caffee/Feature/home/domain/Entity/review_entity.dart';

class ReviewModel {
  final String name;
  final String date;
  final String description;
  final num rate;

  ReviewModel({
    required this.name,
    required this.date,
    required this.description,
    required this.rate,
  });

  ReviewEntity toEntity() {
    return ReviewEntity(
      name: name,
      date: date,
      description: description,
      rate: rate,
    );
  }

  factory ReviewModel.fromJson(Map<String, dynamic> json) {
    return ReviewModel(
      name: json['name'],
      date: json['date'],
      description: json['description'],
      rate: json['rate'],
    );
  }
  factory ReviewModel.fromEntity(ReviewEntity entity) {
    return ReviewModel(
      name: entity.name,
      date: entity.date,
      description: entity.description,
      rate: entity.rate,
    );
  }
  num calculateTotalRate(List<ReviewEntity> entity) {
    num sum = 0;
    num totalRate = 0;
    for (var i = 0; i < entity.length; i++) {
      sum += entity[i].rate;
    }
    totalRate = sum / entity.length;
    return totalRate;
  }
}
