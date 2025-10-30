import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_up_view.dart';
import 'package:caffee/Feature/Auth/Presentation/View/sign_in_view.dart';
import 'package:caffee/Feature/Favorite/presentation/View/favorite_view.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Core/Widget/product_details_view.dart';
import 'package:caffee/main_view.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SignInView.routeName:
      return MaterialPageRoute(builder: (context) => SignInView());

    case SignUpView.routeName:
      return MaterialPageRoute(builder: (context) => SignUpView());

    case ProductDetailsView.routeName:
      return MaterialPageRoute(
        builder: (context) =>
            ProductDetailsView(product: setting.arguments as ProductEntity),
      );

    case MainView.routeName:
      return MaterialPageRoute(builder: (context) => MainView());
    case FavoriteView.routeName:
      return MaterialPageRoute(builder: (context) => FavoriteView());
    
    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
