import 'package:caffee/Core/utils/app_icon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ProfileImage extends StatelessWidget {
  const ProfileImage({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadiusGeometry.circular(50),
      child: SizedBox(
        width: 75,
        height: 75,
        child: SvgPicture.asset(Assets.imagesProfileImage),
      ),
    );
  }
}
