// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/models/template/work_status_items_temp.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/detail/info/info_box.dart';

class WorkStatusList extends StatefulWidget {
  const WorkStatusList({
    super.key,
  });

  @override
  State<WorkStatusList> createState() => _WorkStatusListState();
}

class _WorkStatusListState extends State<WorkStatusList> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            InfoBox(
              title: "Çalışma Saatleri",
              iconName: "time",
              info: "Kapanış 21:00",
            ),
            SizedBox(
              height: 4.h,
              width: 4.h,
              child: IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  setState(() {
                    isOpen = !isOpen;
                  });
                },
                icon: Icon(
                  isOpen
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded,
                  color: mainTextColor,
                  size: 4.h,
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 1.h,
        ),
        isOpen
            ? Expanded(
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 3.2.h,
                          width: 100.w,
                          padding: EdgeInsets.only(left: 11.w),
                          child: workStatusList[index]);
                    }),
              )
            : SizedBox(),
        SizedBox(
          height: 1.h,
        ),
      ],
    );
  }
}
