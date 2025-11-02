import 'package:caffee/Core/error/error_message.dart';
import 'package:caffee/Feature/home/domain/Entity/product_entity.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/product_grid_view_item.dart';
import 'package:caffee/Feature/home/presentation/manager/product_cubit/product_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:skeletonizer/skeletonizer.dart';

class ProductGridViewItemBolcConsumer extends StatelessWidget {
  const ProductGridViewItemBolcConsumer({super.key, required this.products});
  final List<ProductEntity> products;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductCubit, ProductState>(
      listener: (context, state) {
        if (state is ProductFailure) {
          showMessage(context, state.errorMessage);
        }
      },
      builder: (context, state) {
        if (state is ProductSuccess) {
          return ProductGridViewItem(products: state.products);
        } else if (state is ProductLoading) {
          return Skeletonizer.sliver(
            enabled: true,
            child: ProductGridViewItem(products: products),
          );
        }
        return SliverToBoxAdapter(
          child: Center(child: Text('please Try again later')),
        );
      },
    );
  }
}
