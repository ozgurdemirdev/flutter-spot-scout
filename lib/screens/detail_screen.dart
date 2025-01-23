// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/detail/detail_image_list.dart';
import 'package:spot_scout/widgets/detail/info/list_info_box.dart';
import 'package:spot_scout/widgets/detail/map_area.dart';
import 'package:spot_scout/widgets/detail/top_name_tag.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: Stack(
            children: [
              SizedBox(
                height: 30.h,
                width: 100.w,
                child: const DetailImageList(
                  imageLink: "assets/images/template/place_2.png",
                ),
              ),
              Positioned(top: 1.h, left: 1.h, child: BackIcon()),
              Positioned.fill(
                top: secondTopDistance,
                child: Container(
                  padding: EdgeInsets.only(
                      left: mainPadding,
                      right: mainPadding,
                      top: secondTopDistance - 20.h),
                  decoration: BoxDecoration(
                      color: mainBgColor,
                      borderRadius: BorderRadius.only(
                          topLeft: mainBgRadius, topRight: mainBgRadius)),
                  child: Column(
                    children: [
                      const MapArea(),
                      SizedBox(
                        height: 2.h,
                      ),
                      Expanded(child: ListInfoBox())
                    ],
                  ),
                ),
              ),
              const TopNameTag()
            ],
          ),
        ),
      ),
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.5.h,
      width: 4.5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black26,
      ),
      child: Center(
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 2.5.h,
            )),
      ),
    );
  }
}
