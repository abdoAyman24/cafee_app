import 'package:caffee/Feature/Favorite/presentation/View/Widget/favorite_product_item.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:flutter/material.dart';

class FavoriteListViewProduct extends StatelessWidget {
  const FavoriteListViewProduct({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const SizedBox(height: 18),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return FavoriteProductItem(product: products[index]);
      },
    );
  }
}
