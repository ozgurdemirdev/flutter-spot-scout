// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/card_container.dart';
import 'package:spot_scout/widgets/core/place_icon.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';

class TopNameTag extends StatelessWidget {
  const TopNameTag({
    super.key,
    required this.name,
    required this.isOpen,
    required this.rating,
    required this.placeType,
  });
  final String name;
  final String placeType;
  final bool? isOpen;
  final double rating;

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: (secondTopDistance - 3.h),
        left: 7.w,
        right: 7.w,
        child: SizedBox(
          height: 9.h,
          width: 100.w,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                right: 0,
                top: 0,
                child: CardContainer(
                  height: 6.h,
                  child: Container(),
                ),
              ),
              Positioned(
                  left: 0,
                  child: CardContainer(
                      height: 6.h,
                      width: 6.h,
                      padding: EdgeInsets.all(2.w),
                      color: isOpen == null
                          ? warningColor
                          : ((isOpen ?? false) ? successColor : errorColor),
                      child: Center(
                          child: FittedBox(
                        child: PrimaryText(
                          text: isOpen == null
                              ? "Bilinmiyor"
                              : ((isOpen ?? false) ? "Açık" : "Kapalı"),
                          fontSize: 17.sp,
                          fontWeight: FontWeight.w800,
                          textColor: secondTextColor,
                        ),
                      )))),
              Positioned(
                  right: 0,
                  child: CardContainer(
                      height: 6.h,
                      width: 6.h,
                      color: warningColor,
                      child: Center(
                          child: PrimaryText(
                        text: rating.toString(),
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w800,
                        textColor: secondTextColor,
                      )))),
              Positioned(
                left: 15.w,
                right: 15.w,
                top: 0.3.h,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FittedBox(
                      child: PrimaryText(
                        text: name,
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                    SizedBox(
                      height: 1.5.h,
                    ),
                  ],
                ),
              ),
              Transform.translate(
                offset: Offset(0, 1.5.h),
                child: Center(
                  child: CardContainer(
                      height: 3.5.h,
                      padding: EdgeInsets.all(0.5.h),
                      color: iconColors[placeType],
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            width: 0.5.h,
                          ),
                          IconWithNoBg(
                            errorName: "X",
                            iconName: placeType,
                            iconSize: 1.5.h,
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          PrimaryText(
                            text: allPlacesName[placeType] ?? "",
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w600,
                            textColor: secondTextColor,
                          ),
                          SizedBox(
                            width: 0.5.h,
                          ),
                        ],
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
