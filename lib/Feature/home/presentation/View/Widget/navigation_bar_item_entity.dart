import 'package:caffee/icons/cafee_icon_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class NavigationBarItemEntity {
  final String name;
  final IconData activeIcon, inActiveIcon;

  NavigationBarItemEntity({
    required this.name,
    required this.activeIcon,
    required this.inActiveIcon,
  });
}

List<NavigationBarItemEntity> get navList => [
  NavigationBarItemEntity(
    name: 'Home',
    activeIcon: CafeeIcon.home,
    inActiveIcon: CafeeIcon.home_1,
  ),
  NavigationBarItemEntity(
    name: 'Card',
    activeIcon: Icons.shopping_bag,
    inActiveIcon: Icons.shopping_bag_outlined,
  ),
  NavigationBarItemEntity(
    name: 'Favorite',
    activeIcon: CafeeIcon.heart,
    inActiveIcon: CafeeIcon.heart_empty,
  ),
  NavigationBarItemEntity(
    name: 'Setting',
    activeIcon: CafeeIcon.user_1,
    inActiveIcon: CafeeIcon.user,
  ),
];
