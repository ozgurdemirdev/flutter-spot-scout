import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/widgets/core/card_container.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';
import 'package:spot_scout/widgets/main/place/place_list.dart';

class SelectPlace extends StatelessWidget {
  const SelectPlace({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        width: 100.w,
        padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 1.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PrimaryText(
              text: "Mekan Seçiniz",
              fontSize: 16.5.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
                height: 8.h,
                child: PlaceList(
                  key: globalPlaceList,
                ))
          ],
        ));
  }
}
