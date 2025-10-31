import 'package:caffee/Core/Widget/custom_size_item.dart';
import 'package:caffee/Feature/home/presentation/manager/Product_Size_cubit/product_size_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SizeDetailsWidget extends StatefulWidget {
  const SizeDetailsWidget({super.key});

  @override
  State<SizeDetailsWidget> createState() => _SizeDetailsWidgetState();
}

class _SizeDetailsWidgetState extends State<SizeDetailsWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomSizeItem(
          text: 'S',
          isSelect: context.read<ProductSizeCubit>().getSize() == 'priceS'
              ? true
              : false,
          onTap: () {
            context.read<ProductSizeCubit>().updateproductSize(
              ProductSize.smalle,
            );
            context.read<ProductSizeCubit>().generateSize();
            setState(() {});
          },
        ),
        CustomSizeItem(
          text: 'M',
          isSelect: context.read<ProductSizeCubit>().getSize() == 'priceM'
              ? true
              : false,
          onTap: () {
            context.read<ProductSizeCubit>().updateproductSize(
              ProductSize.medium,
            );
            context.read<ProductSizeCubit>().generateSize();

            setState(() {});
          },
        ),
        CustomSizeItem(
          text: 'L',
          isSelect: context.read<ProductSizeCubit>().getSize() == 'priceL'
              ? true
              : false,
          onTap: () {
            context.read<ProductSizeCubit>().updateproductSize(
              ProductSize.large,
            );
            context.read<ProductSizeCubit>().generateSize();

            setState(() {});
          },
        ),
      ],
    );
  }
}
