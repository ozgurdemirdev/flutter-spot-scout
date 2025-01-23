// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';

class WorkStatusItem extends StatelessWidget {
  const WorkStatusItem({super.key, required this.day, required this.time});
  final String day;
  final String time;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PrimaryText(
              text: day,
              textColor: Colors.black54,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
            ),
            PrimaryText(
              text: time,
              textColor: mainTextColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w600,
            ),
          ],
        ),
        SizedBox(
          height: 0.5.h,
        ),
        Container(height: 0.1.h, width: 100.w, color: Colors.black38)
      ],
    );
  }
}
