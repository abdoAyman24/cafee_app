import 'package:caffee/Feature/Cart/Presentation/logic/cart_cubit/cart_cubit.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/custom_bottom_navigation_bar.dart';
import 'package:caffee/Feature/home/presentation/manager/product_cubit/product_cubit.dart';
import 'package:caffee/main_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'homeView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectIndex = 0;
  @override
  void initState() {
    context.read<ProductCubit>().getProducts();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => CartCubit(),
        child: Scaffold(
          bottomNavigationBar: CustomBottomNavigationBar(
            valueChanged: (value) {
              setState(() {
                selectIndex = value;
              });
            },
          ),
          body: MainViewBody(selectIndex: selectIndex),
        ),
      ),
    );
  }
}
