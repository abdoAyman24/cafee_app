import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffee/Core/Utils/app_icon.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_item_entity.dart';
import 'package:flutter/material.dart';

class BasketView extends StatelessWidget {
  const BasketView({super.key, required this.cartEntity});
  final List<CartItemEntity> cartEntity;
  @override
  Widget build(BuildContext context) {
    double screenHight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;
    return SizedBox(
      height: screenHight * 0.5,
      child: Stack(
        children: [
          Image.asset(Assets.imagesBasket),
          ...List.generate(cartEntity.length, (index) {
            const itemsPerColumn = 6;

            final columnIndex = index ~/ itemsPerColumn; // 0,1,2,3...
            final rowIndex = index % itemsPerColumn; // 0..4

            final top = (screenHight * 0.04) + (rowIndex * 50);

            final left = screenWidth * (0.1 + (columnIndex * 0.21));

            return Positioned(
              top: top,
              left: left,
              child: CachedNetworkImage(imageUrl: cartEntity[index].productEntity.imageUrl,width: 100,),
            );
          }),
        ],
      ),
    );
  }
}
