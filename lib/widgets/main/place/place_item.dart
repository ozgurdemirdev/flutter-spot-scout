import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/card_container.dart';
import 'package:spot_scout/widgets/core/place_icon.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';
import 'package:spot_scout/widgets/main/place/place_list.dart';

class PlaceItem extends StatelessWidget {
  const PlaceItem({
    super.key,
    required this.iconName,
    required this.name,
    required this.isSelected,
    required this.index,
  });
  final String iconName;
  final String name;
  final bool isSelected;
  final int index;

  @override
  Widget build(BuildContext context) {
    double boxSize = 7.h;
    return SizedBox(
      height: boxSize,
      width: boxSize,
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.5),
            child: AnimatedContainer(
              height: isSelected ? boxSize : 1.h,
              width: isSelected ? boxSize : 1.h,
              duration: const Duration(milliseconds: 200),
              decoration: BoxDecoration(
                  color: isSelected ? iconColors[iconName] : secondBgColor,
                  borderRadius: BorderRadius.circular(cardRadiusD)),
            ),
          ),
          Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(cardRadiusD),
            child: InkWell(
              borderRadius: BorderRadius.circular(cardRadiusD),
              overlayColor:
                  WidgetStatePropertyAll(iconColors[iconName]!.withAlpha(100)),
              onTap: () {
                if (globalPlaceList.currentState != null) {
                  globalPlaceList.currentState!.refreshState();
                  selectedPlaceIndex = index;
                }
              },
              child: CardContainer(
                height: boxSize,
                width: boxSize,
                isShadow: false,
                color: Colors.transparent,
                padding:
                    EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 0.5.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CircleIconBg(
                      iconName: iconName,
                      name: name,
                    ),
                    FittedBox(
                      child: PrimaryText(
                        text: name,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w700,
                        textColor: isSelected ? secondTextColor : mainTextColor,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
