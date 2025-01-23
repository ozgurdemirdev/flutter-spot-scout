// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/widgets/core/card_container.dart';

class MapArea extends StatelessWidget {
  const MapArea({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        height: 20.h,
        width: 100.w,
        child: Image.asset(
          "assets/images/template/map.png",
          fit: BoxFit.cover,
        ));
  }
}
