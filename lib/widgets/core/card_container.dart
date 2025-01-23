import 'package:flutter/material.dart';
import 'package:spot_scout/settings.dart';

class CardContainer extends StatelessWidget {
  const CardContainer({
    super.key,
    required this.child,
    this.color,
    this.padding,
    this.height,
    this.width,
    this.isShadow,
    this.borderRadius,
  });
  final Widget child;
  final Color? color;
  final EdgeInsets? padding;
  final double? height;
  final double? width;
  final bool? isShadow;
  final BorderRadius? borderRadius;
  @override
  Widget build(BuildContext context) {
    bool openShadow = isShadow ?? true;
    return Container(
        height: height,
        width: width,
        padding: padding,
        decoration: BoxDecoration(
            color: color ?? secondBgColor,
            borderRadius: borderRadius ?? BorderRadius.circular(cardRadiusD),
            boxShadow: openShadow
                ? const [
                    BoxShadow(
                        color: Colors.black38,
                        spreadRadius: -3,
                        blurRadius: 7,
                        offset: Offset(0, 0))
                  ]
                : []),
        child: child);
  }
}
