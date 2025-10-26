import 'dart:developer';

import 'package:caffee/Core/service/shared_preferences.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/custom_bottom_navigation_bar.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/main_view_body.dart';
import 'package:caffee/constance.dart';
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
            log('${SharedPreferencesSingleton.getUser(KUserData)}');
          });
        },
      ),
      body: MainViewBody(selectIndex: selectIndex),
    );
  }
}
