import 'package:caffee/Feature/home/presentation/View/Widget/nave_bar_item.dart';
import 'package:caffee/Feature/home/presentation/View/Widget/navigation_bar_item_entity.dart';
import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.valueChanged});
  final ValueChanged valueChanged;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black.withValues(alpha: 0.92)),
      child: Row(
        children: navList.asMap().entries.map((e) {
          int index = e.key;
          var entity = e.value;
          return Expanded(
            flex: selectedIndex == index ? 3 : 2,
            child: GestureDetector(
              onTap: () {
                Future.delayed(Duration(microseconds: 300), () {
                  setState(() {
                    selectedIndex = index;
                    widget.valueChanged(index);
                  });
                });
              },
              child: SizedBox(
                child: NaveBarItem(
                  isSelect: selectedIndex == index,
                  navBarItem: entity,
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}
