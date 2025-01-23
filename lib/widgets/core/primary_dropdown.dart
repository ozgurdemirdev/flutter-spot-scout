import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';

DropdownMenuItem<dynamic> workStatusDropItem(String text, int value) =>
    DropdownMenuItem(
        value: value,
        child: PrimaryText(
          text: text,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          textColor: secondTextColor,
        ));

int selectedDropItem = 0;

class PrimaryDropdown extends StatefulWidget {
  const PrimaryDropdown({
    super.key,
  });

  @override
  State<PrimaryDropdown> createState() => _PrimaryDropdownState();
}

class _PrimaryDropdownState extends State<PrimaryDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
        value: selectedDropItem,
        underline: const SizedBox(),
        dropdownColor: mainColor,
        borderRadius: BorderRadius.circular(cardRadiusD),
        iconEnabledColor: secondTextColor,
        icon: const Icon(Icons.arrow_drop_down_rounded),
        items: [
          workStatusDropItem("Farketmez", 0),
          workStatusDropItem("Açık", 1),
          workStatusDropItem("Kapalı", 2),
        ],
        onChanged: (value) {
          setState(() {
            selectedDropItem = value;
          });
        });
  }
}
