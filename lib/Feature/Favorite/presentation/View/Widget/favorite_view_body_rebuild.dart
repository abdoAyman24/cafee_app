import 'package:caffee/Core/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/Favorite/presentation/View/Widget/favorite_List_view_product.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FavoriteViewBodyRebuild extends StatelessWidget {
  const FavoriteViewBodyRebuild({super.key});

  @override
  Widget build(BuildContext context) {
    return context.read<FavoriteCubit>().products.isEmpty
        ? Expanded(
            child: Center(child: Text('Empty', style: AppText.bold23)),
          )
        : Expanded(
            child: FavoriteListViewProduct(
              products: context.watch<FavoriteCubit>().products,
            ),
          );
  }
}
