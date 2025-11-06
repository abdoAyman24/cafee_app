import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomElevatButton extends StatelessWidget {
  const CustomElevatButton({
    super.key,
    required this.text,
    required this.onPressed,
  });
  final String text;

  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: onPressed,
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: AppText.semiBold20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
