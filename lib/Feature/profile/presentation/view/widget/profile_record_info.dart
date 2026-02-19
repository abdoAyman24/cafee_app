import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class ProfileRecordInfo extends StatelessWidget {
  const ProfileRecordInfo({super.key, required this.text, this.onPressed});
  final String text;
  final Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: onPressed,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Row(
              children: [
                Text(text, style: AppText.medium18),
                Spacer(),
                Icon(Icons.arrow_forward_ios),
              ],
            ),
          ),
        ),
        Divider(height: 10),
      ],
    );
  }
}
