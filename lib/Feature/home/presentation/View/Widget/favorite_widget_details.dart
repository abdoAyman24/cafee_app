import 'package:caffee/Core/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteWidgetDetails extends StatelessWidget {
  const FavoriteWidgetDetails({super.key, required this.productEntity});
  final ProductEntity productEntity;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 15,
      top: 15,
      child: InkWell(
        onTap: () {
          if (context.read<FavoriteCubit>().isFavorite(productEntity)) {
            context.read<FavoriteCubit>().deleteFromFavorite(productEntity);
          } else {
            context.read<FavoriteCubit>().addToFavorite(productEntity);
          }
        },
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: ShapeDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, 0.00),
              end: Alignment(1.00, 1.00),
              colors: [
                const Color(0xFF37373C),
                const Color(0xFF313139),
                Colors.black,
              ],
            ),
            shape: RoundedRectangleBorder(
              side: BorderSide(width: 1, color: const Color(0xFF131313)),
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          child: context.watch<FavoriteCubit>().isFavorite(productEntity)
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border_outlined),
        ),
      ),
    );
  }
}
