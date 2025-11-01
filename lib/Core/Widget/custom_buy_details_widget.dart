import 'package:caffee/Core/Utils/app_color.dart';
import 'package:caffee/Core/Utils/app_text_styles.dart';
import 'package:caffee/Feature/Cart/Presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Feature/home/presentation/manager/Product_Size_cubit/product_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyDetailsWidget extends StatefulWidget {
  const BuyDetailsWidget({super.key, required this.product});

  final ProductEntity product;

  @override
  State<BuyDetailsWidget> createState() => _BuyDetailsWidgetState();
}

class _BuyDetailsWidgetState extends State<BuyDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '\$',
                style: AppText.medium24.copyWith(color: appColor.primary),
              ),
              const SizedBox(width: 5),
              BlocBuilder<ProductSizeCubit, ProductSizeState>(
                builder: (context, state) {
                  if (state is Large) {
                    return Text(
                      widget.product.priceL.toString(),
                      style: AppText.bold28,
                    );
                  } else if (state is Medium) {
                    return Text(
                      widget.product.priceM.toString(),
                      style: AppText.bold28,
                    );
                  } else {
                    return Text(
                      widget.product.priceS.toString(),
                      style: AppText.bold28,
                    );
                  }
                },
              ),
            ],
          ),
        ),
        Expanded(
          flex: 2,
          child: GestureDetector(
            onTap: () {
              context.read<CartCubit>().addProduct(ProductEntity(imageUrl: widget.product.imageUrl,
               productId: widget.product.productId, name: widget.product.name,
                additional: widget.product.additional, details: widget.product.details, rate: widget.product.rate,
                 priceS:context.read<ProductSizeCubit>().productSize==ProductSize.smalle?
                  widget.product.priceS:context.read<ProductSizeCubit>().productSize==ProductSize.medium?widget.product.priceM:widget.product.priceL, 
                 priceM: widget.product.priceM, priceL: widget.product.priceL, 
                 reviewEntity: widget.product.reviewEntity));
            },
            child: Container(
              height: 20.h,
              decoration: ShapeDecoration(
                color: appColor.primary,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(child: Text('Buy Now', style: AppText.bold28)),
            ),
          ),
        ),
      ],
    );
  }
}
