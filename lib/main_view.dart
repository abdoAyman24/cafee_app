
import 'package:caffee/Feature/home/presentation/View/Widget/custom_bottom_navigation_bar.dart';
import 'package:caffee/main_view_body.dart';
import 'package:flutter/material.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  static const String routeName = 'homeView';

  @override
  State<MainView> createState() => _MainViewState();
}

class _MainViewState extends State<MainView> {
  int selectIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: CustomBottomNavigationBar(
        valueChanged: (value) {
          setState(() {
            selectIndex = value;
          
          });
        },
      ),
      body: MainViewBody(selectIndex: selectIndex),
    );
  }
}
