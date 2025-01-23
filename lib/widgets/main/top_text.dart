// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';
import 'package:spot_scout/widgets/core/card_container.dart';

class TopText extends StatelessWidget {
  const TopText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: (mainTopDistance - 4.h),
        left: 7.w,
        right: 7.w,
        child: CardContainer(
          height: 7.h,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PrimaryText(
                text: "Nereye Gitmeniz Gerek?",
                fontSize: 20.sp,
                fontWeight: FontWeight.w900,
              ),
              SizedBox(
                height: 0.4.h,
              ),
              PrimaryText(
                text: "Size en yakın konumu bulalım",
                fontSize: 15.sp,
                fontWeight: FontWeight.w200,
              ),
            ],
          ),
        ));
  }
}
