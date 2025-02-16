import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';

class CircleIconBg extends StatelessWidget {
  const CircleIconBg({
    super.key,
    required this.iconName,
    this.name,
    this.size,
    this.color,
    this.iconSize,
    this.onTapFunc,
  });
  final String iconName;
  final String? name;
  final double? size;
  final double? iconSize;
  final Function? onTapFunc;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    String errorName = "";
    errorName = name ?? "X";
    Color bgColor = mainColor;

    if (color == null && iconColors[iconName] != null) {
      bgColor = iconColors[iconName]!;
    }

    return Material(
      color: (onTapFunc == null) ? Colors.transparent : bgColor,
      borderRadius: BorderRadius.circular(30),
      child: InkWell(
        borderRadius: BorderRadius.circular(30),
        onTap: onTapFunc != null ? () => onTapFunc!() : null,
        child: Container(
            height: size ?? 4.h,
            width: size ?? 4.h,
            padding: EdgeInsets.all(0.8.h),
            decoration: BoxDecoration(
                color: (onTapFunc == null) ? bgColor : Colors.transparent,
                borderRadius: BorderRadius.circular(30)),
            child: IconWithNoBg(
                iconName: iconName, errorName: errorName, iconSize: iconSize)),
      ),
    );
  }
}

class IconWithNoBg extends StatelessWidget {
  const IconWithNoBg({
    super.key,
    required this.iconName,
    required this.errorName,
    this.iconSize,
  });

  final String iconName;
  final String errorName;
  final double? iconSize;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/icons/$iconName.png",
      errorBuilder: (context, error, stackTrace) {
        return Center(
            child: PrimaryText(
          text: errorName[0],
          fontSize: iconSize ?? 17.sp,
          textColor: secondTextColor,
          fontWeight: FontWeight.w900,
        ));
      },
    );
  }
}
