import 'package:caffee/Feature/home/presentation/View/Widget/active_item.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/inActive_item.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/navigation_bar_item_entity.dart';
import 'package:flutter/material.dart';

class NaveBarItem extends StatelessWidget {
  const NaveBarItem({super.key, required this.isSelect, required this.navBarItem});
  final bool isSelect;
  final NavigationBarItemEntity navBarItem;
  @override
  Widget build(BuildContext context) {
    return isSelect ?ActiveItem(text: navBarItem.name, icon: navBarItem.activeIcon):InactiveItem(icon: navBarItem.inActiveIcon);
  }
}
