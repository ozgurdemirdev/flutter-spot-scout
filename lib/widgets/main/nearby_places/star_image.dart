import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';

class StarImage extends StatelessWidget {
  const StarImage({super.key, required this.isActive});
  final bool isActive;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Image.asset(
          height: 1.2.h,
          width: 1.2.h,
          "assets/images/icons/star.png",
          color: isActive ? starActiveColor : starPasiveColor,
        ),
        SizedBox(width: 0.7.w),
      ],
    );
  }
}
