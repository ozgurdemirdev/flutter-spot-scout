// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/place_icon.dart';

class DetailImageList extends StatelessWidget {
  const DetailImageList(
      {super.key, required this.imageLink, required this.placeType});
  final String imageLink;
  final String placeType;
  @override
  Widget build(BuildContext context) {
    print("Type:" + placeType);
    Color? iconColor = iconColors[placeType];
    return Image.network(
      imageLink,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          decoration: BoxDecoration(
            color: iconColor,
          ),
          child: Center(
            child: IconWithNoBg(
              errorName: "x",
              iconName: placeType,
              iconSize: 4.h,
            ),
          ),
        );
      },
    );
  }
}
