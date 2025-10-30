import 'package:cached_network_image/cached_network_image.dart';
import 'package:caffee/Core/Utils/app_text_styles.dart';
import 'package:caffee/Core/Widget/custom_buy_details_widget.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Core/Widget/details_back_bottom.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/favorite_widget_details.dart';
import 'package:caffee/Core/Widget/product_details_widget.dart';
import 'package:caffee/Core/Widget/size_details_widget.dart';
import 'package:flutter/material.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});
  final ProductEntity product;
  static const String routeName = 'ProductDetailsView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.6,
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadiusGeometry.circular(29),
                    child: CachedNetworkImage(
                      height: MediaQuery.of(context).size.height * 0.6,
                      width: double.infinity,
                      placeholder: (context, url) =>
                          CircularProgressIndicator(),
                      errorWidget: (context, url, error) => Icon(Icons.error),
                      imageUrl: product.imageUrl,
                      fit: BoxFit.cover,
                    ),
                  ),
                  FavoriteWidgetDetails(),
                  DetailsBackBottom(),
                  ProductDetailsWidget(product: product),
                ],
              ),
            ),
            const SizedBox(height: 15),
            Text('Description', style: AppText.medium18),
            const SizedBox(height: 20),
            Text(
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              product.details,
              style: AppText.medium16,
            ),
            const SizedBox(height: 15),
            Text('Size', style: AppText.medium16),
            const SizedBox(height: 15),
            SizeDetailsWidget(),
            const Spacer(),
          BuyDetailsWidget(product: product),
          ],
        ),
      ),
    );
  }
}
