// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/place_icon.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';

class InfoBox extends StatelessWidget {
  const InfoBox({
    super.key,
    required this.title,
    required this.info,
    required this.iconName,
    this.height,
  });
  final String title;
  final String info;
  final String iconName;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height ?? 4.h,
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleIconBg(size: 4.2.h, iconName: iconName),
          SizedBox(
            width: 2.w,
          ),
          SizedBox(
            width: 70.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PrimaryText(
                  text: title,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w400,
                  textColor: Colors.black54,
                ),
                PrimaryText(
                  text: info,
                  fontSize: 15.5.sp,
                  fontWeight: FontWeight.w600,
                  textColor: mainTextColor,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
