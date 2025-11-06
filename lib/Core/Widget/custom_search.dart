import 'package:caffee/Core/Utils/app_color.dart';
import 'package:caffee/Core/Utils/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: ShapeDecoration(
        color: const Color(0xD81E1F22),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Row(
          children: [
            Icon(
              Icons.manage_search_sharp,
              size: 30,
              color: appColor.greyText,
            ),
            const SizedBox(width: 15),
            Text(
              'Find Your Caffee',
              style: AppText.bold19.copyWith(color: appColor.greyText),
            ),
          ],
        ),
      ),
    );
  }
}
