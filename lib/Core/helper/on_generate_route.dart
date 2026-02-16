import 'package:caffee/Core/Cubit/favorite_cubit/favorite_cubit.dart';
import 'package:caffee/Feature/Auth/Presentation/View/Widget/sign_up_view.dart';
import 'package:caffee/Feature/Auth/Presentation/View/sign_in_view.dart';
import 'package:caffee/Feature/Cart/Presentation/View/cart_view.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:caffee/Feature/Cart/domain/entity/cart_entity.dart';
import 'package:caffee/Feature/Favorite/presentation/View/favorite_view.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Core/Widget/product_details_view.dart';
import 'package:caffee/Feature/payment/presentation/view/payment_view.dart';
import 'package:caffee/Feature/payment/presentation/view/payment_details_view.dart';
import 'package:caffee/Feature/payment/presentation/view/thank_view.dart';
import 'package:caffee/Feature/profile/presentation/view/my_orders.dart';
import 'package:caffee/Feature/profile/presentation/view/profile.dart';
import 'package:caffee/Feature/profile/presentation/view/widget/payment_option.dart';
import 'package:caffee/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Route<dynamic> onGenerateRoute(RouteSettings setting) {
  switch (setting.name) {
    case SignInView.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: SignInView.routeName),

        builder: (context) => SignInView(),
      );

    case SignUpView.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: SignUpView.routeName),

        builder: (context) => SignUpView(),
      );

    case CartView.routeName:
      return MaterialPageRoute(builder: (context) => CartView());
    case ProductDetailsView.routeName:
      final args = setting.arguments as Map<String, dynamic>;

      final product = args['product'] as ProductEntity;
      final cartCubit = args['cartCubit'] as CartCubit;
      final favoriteCubit = args['favoriteCubit'] as FavoriteCubit;

      return MaterialPageRoute(
        settings: RouteSettings(name: CartView.routeName),

        builder: (context) => MultiBlocProvider(
          providers: [
            BlocProvider.value(value: cartCubit),
            BlocProvider.value(value: favoriteCubit),
          ],
          child: ProductDetailsView(product: product),
        ),
      );

    case MainView.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: MainView.routeName),
        builder: (context) => MainView(),
      );

    case Profile.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: Profile.routeName),
        builder: (context) => Profile(),
      );

    case PaymentOption.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: PaymentOption.routeName),
        builder: (context) => PaymentOption(),
      );

    case PaymentView.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: PaymentView.routeName),

        builder: (context) =>
            PaymentView(cartEntity: setting.arguments as CartEntity),
      );

    case FavoriteView.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: FavoriteView.routeName),

        builder: (context) => FavoriteView(),
      );

    case PaymentDetailsView.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: PaymentDetailsView.routeName),

        builder: (context) =>
            PaymentDetailsView(cartEntit: setting.arguments as CartEntity),
      );

    case ThankView.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: ThankView.routeName),

        builder: (context) =>
            ThankView(totalPrice: setting.arguments as double),
      );
      case MyOrders.routeName:
      return MaterialPageRoute(
        settings: RouteSettings(name: MyOrders.routeName),

        builder: (context) =>
            MyOrders(),
      );

    default:
      return MaterialPageRoute(builder: (context) => const Scaffold());
  }
}
