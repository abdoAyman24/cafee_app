import 'package:caffee/Core/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_up_view.dart';
import 'package:caffee/Feature/Auth/Presentation/View/sign_in_view.dart';
import 'package:caffee/Feature/Cart/Presentation/View/cart_view.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:caffee/Feature/Favorite/presentation/View/favorite_view.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Core/Widget/product_details_view.dart';
import 'package:caffee/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => SignInView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => SignUpView());

    case CartView.routeName:
    
      return MaterialPageRoute(builder: (context) => CartView());
    case ProductDetailsView.routeName:
    final args = setting.arguments as Map<String, dynamic>;

  final product = args['product'] as ProductEntity;
  final cartCubit = args['cartCubit'] as CartCubit;
  final favoriteCubit = args['favoriteCubit'] as FavoriteCubit;


      return MaterialPageRoute(
    builder: (context) => MultiBlocProvider(
      providers: [
        BlocProvider.value(value: cartCubit),
        BlocProvider.value(value: favoriteCubit),
      ],
      child: ProductDetailsView(product: product),
    ),
      );

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());
    case FavoriteView.routeName:
      return MaterialPageRoute(builder: (context) => FavoriteView());

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
