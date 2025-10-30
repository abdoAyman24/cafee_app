
import 'package:caffee/Core/Widget/custom_size_item.dart';
import 'package:flutter/material.dart';

class SizeDetailsWidget extends StatefulWidget {
  const SizeDetailsWidget({super.key});

  @override
  State<SizeDetailsWidget> createState() => _SizeDetailsWidgetState();
}

class _SizeDetailsWidgetState extends State<SizeDetailsWidget> {
  Size size = Size.Smalle;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomSizeItem(
          text: 'S',
          isSelect: size == Size.Smalle,
          onTap: () {
            size = Size.Smalle;
            setState(() {});
          },
        ),
        CustomSizeItem(
          text: 'M',
          isSelect: size == Size.Medium,
          onTap: () {
            size = Size.Medium;
            setState(() {});
            
          },
        ),
        CustomSizeItem(
          text: 'L',
          isSelect: size == Size.Large,
          onTap: () {
            size = Size.Large;
            setState(() {});
          },
        ),
      ],
    );
  }
}

enum Size { Smalle, Large, Medium }
