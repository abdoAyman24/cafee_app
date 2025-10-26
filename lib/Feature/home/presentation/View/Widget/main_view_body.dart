import 'package:caffee/Feature/home/presentation/View/home_view.dart';
import 'package:flutter/material.dart';

class MainViewBody extends StatelessWidget {
  const MainViewBody({super.key, required this.selectIndex});
  final int selectIndex;
  @override
  Widget build(BuildContext context) {
    return IndexedStack(
      index: selectIndex,
      
      children: [
        HomeView(),
        SizedBox(
          child: Text('Card', style: TextStyle(color: Colors.white)),
        ),
        SizedBox(child: Text('Favorite')),
        SizedBox(child: Text('Setting')),
      ],
    );
  }
}
