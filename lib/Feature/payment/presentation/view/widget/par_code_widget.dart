import 'package:caffee/Core/utils/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ParCodeWidget extends StatelessWidget {
  const ParCodeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: 0,
      left: 0,
      bottom: (MediaQuery.of(context).size.height * 0.2 / 2) - 20,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.qr_code_outlined, size: 50),
            Container(
              width: 56.w,
              height: 17.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1.50, color: const Color(0xFF34A853)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(
                child: Text(
                  'PAID',
                  style: AppText.semiBold24.copyWith(
                    color: const Color(0xFF34A853),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
