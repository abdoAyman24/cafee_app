import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/product_item.dart';
import 'package:flutter/material.dart';

class ProductGridViewItem extends StatelessWidget {
  const ProductGridViewItem({super.key, required this.products});

  final List<ProductEntity> products;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 15,
        childAspectRatio: 0.72,
        mainAxisSpacing: 15,
      ),
      itemCount: products.length,
      itemBuilder: (context, index) {
        return Product_item(product: products[index]);
      },
    );
  }
}
