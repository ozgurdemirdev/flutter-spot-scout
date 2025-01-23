import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';
import 'package:spot_scout/widgets/main/nearby_places/star_image.dart';

class PlaceScore extends StatelessWidget {
  const PlaceScore({
    super.key,
    required this.score,
  });
  final double score;
  @override
  Widget build(BuildContext context) {
    int scoreInt = score.toInt();
    return Row(
      children: [
        Container(
          height: 2.h,
          width: 7.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3),
            color: mainColor,
          ),
          child: Center(
            child: PrimaryText(
              text: score.toString(),
              textColor: secondTextColor,
              fontSize: 13.5.sp,
              fontWeight: FontWeight.w300,
            ),
          ),
        ),
        SizedBox(
          width: 1.5.w,
        ),
        Row(
          children: List.generate(5, (index) {
            return StarImage(isActive: (index < scoreInt) ? true : false);
          }),
        )
      ],
    );
  }
}
