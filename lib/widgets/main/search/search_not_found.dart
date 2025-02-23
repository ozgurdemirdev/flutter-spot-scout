import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound(
      {super.key, required this.title, required this.secondTitle});
  final String title;
  final String secondTitle;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          height: 4.h,
        ),
        PrimaryText(
          text: title,
          fontSize: 18.sp,
          fontWeight: FontWeight.w900,
          textColor: errorColor,
        ),
        PrimaryText(
          text: secondTitle,
          fontSize: 15.sp,
          fontWeight: FontWeight.w400,
        ),
        Expanded(
            child: Center(
                child: Image.asset("assets/images/general/not_found.png")))
      ],
    );
  }
}
