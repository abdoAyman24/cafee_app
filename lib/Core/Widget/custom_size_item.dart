import 'package:caffee/Core/Utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSizeItem extends StatelessWidget {
  const CustomSizeItem({
    super.key,
    required this.text,
    required this.isSelect,
    required this.onTap,
  });
  final String text;
  final bool isSelect;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 50),
        decoration: ShapeDecoration(
          color: isSelect ? Colors.black : const Color(0xD81A1A1D),
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 1,
              color: isSelect ? const Color(0xFFB77651) : Colors.transparent,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Center(child: Text(text, style: AppText.bold28)),
      ),
    );
  }
}
