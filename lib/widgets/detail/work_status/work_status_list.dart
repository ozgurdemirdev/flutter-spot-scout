// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/models/selected_place_model.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/detail/info/info_box.dart';
import 'package:spot_scout/widgets/detail/work_status/work_status_item.dart';

class WorkStatusList extends StatefulWidget {
  const WorkStatusList({
    super.key,
    required this.openingHours,
  });

  @override
  State<WorkStatusList> createState() => _WorkStatusListState();

  final OpeningHours? openingHours;
}

class _WorkStatusListState extends State<WorkStatusList> {
  bool isOpen = false;

  @override
  Widget build(BuildContext context) {
    if (widget.openingHours == null) {
      return InfoBox(
        title: "Çalışma Saatleri",
        iconName: "time",
        info: "Bilinmiyor",
      );
    }

    OpeningHours hours = widget.openingHours as OpeningHours;
    List<WorkStatusItem> workStatusAll = [];
    for (String day in hours.weekdayText) {
      workStatusAll.add(WorkStatusItem(
          day: day.split(' ')[0].replaceAll(':', ' '),
          time: day.split(' ')[1]));
    }

    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              InfoBox(
                title: "Çalışma Saatleri",
                iconName: "time",
                info: getOpenCloseTime(
                    hours.weekdayText, (hours.openNow ?? false)),
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
                            child: workStatusAll[index]);
                      }),
                )
              : SizedBox(),
          SizedBox(
            height: 1.h,
          ),
        ],
      ),
    );
  }
}

String getOpenCloseTime(List<String> weekDays, bool openNow) {
  return openNow
      ? 'Kapanış ${weekDays[DateTime.now().weekday - 1].split(' ')[1].split('–')[1]}'
      : 'Açılış ${weekDays[DateTime.now().weekday - 1].split(' ')[1].split('–')[0]}';
}
