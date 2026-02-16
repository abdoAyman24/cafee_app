import 'package:caffee/Feature/Cart/Presentation/View/cart_view.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:caffee/Feature/Favorite/presentation/View/favorite_view.dart';
import 'package:caffee/Feature/home/presentation/View/home_view.dart';
import 'package:caffee/Feature/profile/presentation/view/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.selectIndex});
  final int selectIndex;
  @override
  Widget build(BuildContext context) {
    return BlocListener<CartCubit, CartState>(
      listener: (context, state) {},
      child: IndexedStack(
        index: selectIndex,

        children: [
          HomeView(),
          CartView(),
          FavoriteView(),
         Profile(),
        ],
      ),
    );
  }
}
