import 'package:caffee/Core/efwkmfekld/app_text_styles.dart';
import 'package:flutter/material.dart';

class ActiveItem extends StatelessWidget {
  const ActiveItem({super.key, required this.text, required this.icon});
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: const Color(0xFFB77651)),
        const SizedBox(width: 5),
        Text(
          text,
          style: AppText.bold20.copyWith(color: const Color(0xFFB77651)),
        ),
      ],
    );
  }
}
