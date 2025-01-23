// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/widgets/detail/info/info_box.dart';
import 'package:spot_scout/widgets/detail/work_status/work_status_list.dart';

class ListInfoBox extends StatelessWidget {
  const ListInfoBox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoBox(
              title: "Adres",
              iconName: "location",
              info: "Mehmetçik Sk. No:3-7",
            ),
            Image.asset(
              "assets/images/icons/google_maps.png",
              fit: BoxFit.contain,
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        InfoBox(
          title: "Telefon No.",
          iconName: "phone",
          info: "0850 xxx xxxx",
        ),
        SizedBox(
          height: 3.h,
        ),
        InfoBox(
          title: "Uzaklık",
          iconName: "distance",
          info: "657 m",
        ),
        SizedBox(
          height: 3.h,
        ),
        Expanded(child: WorkStatusList()),
      ],
    );
  }
}
