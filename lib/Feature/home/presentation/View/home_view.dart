import 'package:caffee/Core/dummy_data/dummy_product.dart';
import 'package:caffee/Core/Widget/custom_search.dart';
import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/home_app_bar.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/product_grid_view_item_bloc_consumer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  HomeAppBar(),
                  SizedBox(height: 12.h),
                  Text('Find The Best', style: AppText.bold28),
                  Text('Coffee For You', style: AppText.bold28),
                  SizedBox(height: 11.h),
                  CustomSearch(),
                  SizedBox(height: 11.h),
                ],
              ),
            ),
            ProductGridViewItemBolcConsumer(products: DummyProduct().products),
          ],
        ),
      ),
    );
  }
}
