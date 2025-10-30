import 'package:caffee/Core/Utils/app_color.dart';
import 'package:caffee/Core/Utils/app_text_styles.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:flutter/material.dart';

class ProductDetailsWidget extends StatelessWidget {
  const ProductDetailsWidget({super.key, required this.product});
  final ProductEntity product;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0,
      child: Container(
        width: MediaQuery.of(context).size.width,

        decoration: ShapeDecoration(
          color: const Color(0xAA1D0D00),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(29),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(22.0),
          child: Column(
            children: [
              Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.semiBold28,
                      ),
                      Text(
                        product.additional,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: AppText.regular18.copyWith(color: Colors.grey),
                      ),
                      Row(
                        children: [
                          Icon(Icons.star_rounded, color: appColor.primary),
                          const SizedBox(width: 6),
                          Text('4.5', style: AppText.medium20),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.20),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: const Color(0xFF010101),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Icon(
                                Icons.free_breakfast,
                                color: appColor.primary,
                              ),
                            ),
                            const SizedBox(width: 20),
                            Container(
                              padding: EdgeInsets.all(12),
                              decoration: ShapeDecoration(
                                color: Colors.black,
                                shape: RoundedRectangleBorder(
                                  side: BorderSide(
                                    width: 1,
                                    color: const Color(0xFF010101),
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: Icon(
                                Icons.water_drop_sharp,
                                color: appColor.primary,
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 15),
                        Container(
                          padding: EdgeInsets.all(8),
                          decoration: ShapeDecoration(
                            color: Colors.black,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1,
                                color: const Color(0xFF010101),
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: Text(
                            'Medium roasted',
                            style: AppText.regular13.copyWith(
                              color: const Color.fromARGB(255, 255, 255, 255),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
