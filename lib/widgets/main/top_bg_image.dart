// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopBgImage extends StatelessWidget {
  const TopBgImage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      "assets/images/general/top_main.png",
      width: 100.w,
      fit: BoxFit.cover,
    );
  }
}
