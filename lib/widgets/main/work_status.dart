import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_dropdown.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';
import 'package:spot_scout/widgets/core/card_container.dart';

//Google nearbysearch desteklemediği için kaldırıldı
class WorkStatus extends StatelessWidget {
  const WorkStatus({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        height: 6.h,
        padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 0.7.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryText(
              text: "Çalışma Durumu",
              fontSize: 16.5.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              width: 5.w,
            ),
            CardContainer(
                height: 4.h,
                color: mainColor,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.7.h),
                child: const PrimaryDropdown())
          ],
        ));
  }
}
