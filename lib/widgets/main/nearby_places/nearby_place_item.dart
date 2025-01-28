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
    required this.placeScore,
    required this.placeType,
    required this.isOpen,
  });

  final String imageLink;
  final String placeName;
  final int placeDistance;
  final double placeScore;
  final String placeType;
  final bool? isOpen;

  @override
  Widget build(BuildContext context) {
    int nearbyDistance = placeDistance + ((placeDistance * 30) ~/ 100);
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
            openDetailScreen(context);
          },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 25.w,
                    height: 100.h,
                    decoration: BoxDecoration(
                        color: iconColors[placeType],
                        borderRadius: BorderRadius.only(
                            topLeft: cardRadius, bottomLeft: cardRadius)),
                    child: Center(
                      child: CircleIconBg(iconName: placeType, size: 7.h),
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
                            text: placeName.length > 20
                                ? truncatePlaceName(placeName)
                                : placeName,
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
                        title: "Yürüyüş ile",
                        info:
                            '${(placeDistance / 61.9).ceil()} - ${(nearbyDistance / 61.9).ceil()} dk',
                      ),
                      InfoContainer(
                        title: "Yaklaşık Uzaklık",
                        info: placeDistance < 1000
                            ? '$placeDistance - $nearbyDistance m'
                            : '${(placeDistance / 1000).toStringAsFixed(1)} - ${(nearbyDistance / 1000).toStringAsFixed(1)} km',
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
                        color: isOpen == null
                            ? warningColor
                            : ((isOpen ?? false) ? successColor : errorColor),
                        isShadow: false,
                        width: 12.w,
                        padding: EdgeInsets.all(0.2.h),
                        borderRadius: BorderRadius.circular(5),
                        child: Center(
                            child: FittedBox(
                          child: PrimaryText(
                            text: isOpen == null
                                ? "Bilinmiyor"
                                : ((isOpen ?? false) ? "Açık" : "Kapalı"),
                            fontSize: 14.sp,
                            fontWeight: FontWeight.bold,
                            textColor: secondTextColor,
                          ),
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
                            openDetailScreen(context);
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

String truncatePlaceName(String placeName) {
  if (placeName.length > 20) {
    int lastSpaceIndex = placeName.substring(0, 16).lastIndexOf(' ');
    return lastSpaceIndex != -1
        ? placeName.substring(0, lastSpaceIndex)
        : placeName.substring(0, 16);
  }
  return '$placeName...';
}
