import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';

class InfoContainer extends StatelessWidget {
  const InfoContainer({
    super.key,
    required this.title,
    required this.info,
  });
  final String title;
  final String info;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        PrimaryText(
          text: title,
          fontSize: 15.sp,
          fontWeight: FontWeight.w600,
        ),
        PrimaryText(
          text: info,
          fontSize: 13.sp,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
