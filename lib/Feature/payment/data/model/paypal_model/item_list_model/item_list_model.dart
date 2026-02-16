import 'order_item_model.dart';

class OrderItemListModel {
  List<OrderItemModel>? items;

  OrderItemListModel({this.items});

  factory OrderItemListModel.fromJson(Map<String, dynamic> json) => OrderItemListModel(
    items: (json['items'] as List<dynamic>?)
        ?.map((e) => OrderItemModel.fromJson(e as Map<String, dynamic>))
        .toList(),
  );

  Map<String, dynamic> toJson() => {
    'items': items?.map((e) => e.toJson()).toList(),
  };
}
