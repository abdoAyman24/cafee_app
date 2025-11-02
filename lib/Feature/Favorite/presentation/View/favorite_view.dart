import 'package:caffee/Feature/Favorite/presentation/View/Widget/favorite_view_body.dart';
import 'package:flutter/material.dart';

class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});
  static const String routeName = 'FavoriteView';
  @override
  Widget build(BuildContext context) {
     return Scaffold(body: FavoriteViewBody());
  }
}
