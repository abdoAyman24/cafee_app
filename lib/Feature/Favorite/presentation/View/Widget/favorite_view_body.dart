import 'package:caffee/Core/Utils/app_color.dart';
import 'package:caffee/Core/Widget/customAppBar.dart';
import 'package:caffee/Core/Widget/custom_search.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/Favorite/presentation/View/Widget/favorite_view_body_rebuild.dart';
import 'package:flutter/material.dart';

class FavoriteViewBody extends StatelessWidget {
  const FavoriteViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        children: [
          CustomAppBar(
            leftWidget: Text('Favorites', style: AppText.bold28),
            rightWidget: Icon(
              Icons.filter_list_outlined,
              color: appColor.greyText,
            ),
          ),
          const SizedBox(height: 20),
          CustomSearch(),

          const SizedBox(height: 20),
          FavoriteViewBodyRebuild(),
        ],
      ),
    );
  }
}
