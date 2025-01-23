import 'dart:math';

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/routers.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/card_container.dart';
import 'package:spot_scout/widgets/core/place_icon.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';
import 'package:spot_scout/widgets/main/nearby_places/info_container.dart';
import 'package:spot_scout/widgets/main/nearby_places/place_score.dart';

class NearbyPlaceItem extends StatelessWidget {
  const NearbyPlaceItem({
    super.key,
    required this.imageLink,
    required this.placeName,
    required this.placeDistance,
    required this.placeClosingTime,
    required this.placeScore,
    required this.placeType,
  });

  final String imageLink;
  final String placeName;
  final String placeDistance;
  final String placeClosingTime;
  final double placeScore;
  final String placeType;

  static String generateRandomDistance() {
    Random random = Random();
    int distance =
        random.nextInt(2000) + 100; // 100 m ile 2000 m arasında rastgele mesafe
    return "$distance m";
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      height: 15.h,
      width: 100.w,
      child: Material(
        borderRadius: BorderRadius.circular(cardRadiusD),
        color: secondBgColor,
        child: InkWell(
          borderRadius: BorderRadius.circular(cardRadiusD),
          overlayColor: WidgetStatePropertyAll(mainColor.withAlpha(150)),
          onTap: () {
            OpenDetailScreen(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                        topLeft: cardRadius, bottomLeft: cardRadius),
                    child: Image.asset(
                      imageLink,
                      fit: BoxFit.cover,
                      width: 25.w,
                      height: 100.h,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          PrimaryText(
                            text: placeName,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w700,
                          ),
                          SizedBox(
                            height: 0.2.h,
                          ),
                          PlaceScore(
                            score: placeScore,
                          )
                        ],
                      ),
                      InfoContainer(
                        title: "Uzaklık",
                        info: placeDistance,
                      ),
                      InfoContainer(
                        title: "Kapanış Saati",
                        info: placeClosingTime,
                      ),
                    ],
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.all(1.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CardContainer(
                        height: 2.5.h,
                        color: successColor,
                        isShadow: false,
                        width: 12.w,
                        borderRadius: BorderRadius.circular(5),
                        child: Center(
                            child: PrimaryText(
                          text: "Açık",
                          fontSize: 14.sp,
                          fontWeight: FontWeight.bold,
                          textColor: secondTextColor,
                        ))),
                    Row(
                      children: [
                        CircleIconBg(
                          size: 3.5.h,
                          iconName: "location",
                          color: mainColor,
                          onTapFunc: () {},
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        CircleIconBg(
                          size: 3.5.h,
                          iconName: "eye",
                          color: mainColor,
                          onTapFunc: () {
                            OpenDetailScreen(context);
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
