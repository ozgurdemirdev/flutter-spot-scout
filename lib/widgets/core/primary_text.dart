// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';

class PrimaryText extends StatelessWidget {
  const PrimaryText({
    super.key,
    required this.text,
    this.fontSize,
    this.fontWeight,
    this.textColor,
    this.textAlign,
    this.height,
    this.onClick,
  });

  final String text;
  final double? fontSize;
  final FontWeight? fontWeight;
  final Color? textColor;
  final TextAlign? textAlign;
  final double? height;
  final Function? onClick;

  @override
  Widget build(BuildContext context) {
    return (onClick != null)
        ? Material(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(5),
            child: InkWell(
              borderRadius: BorderRadius.circular(5),
              onTap: () {
                if (onClick != null) {
                  onClick!();
                }
              },
              child: Text(text,
                  textAlign: textAlign ?? TextAlign.start,
                  overflow: TextOverflow.fade,
                  style: GoogleFonts.nunito(
                    textStyle: Theme.of(context).textTheme.displayMedium,
                    fontSize: fontSize ?? 20.sp,
                    color: textColor ?? mainTextColor,
                    fontWeight: fontWeight ?? FontWeight.w400,
                    height: height,
                  )),
            ),
          )
        : Text(text,
            textAlign: textAlign ?? TextAlign.start,
            style: GoogleFonts.nunito(
              textStyle: Theme.of(context).textTheme.displayMedium,
              fontSize: fontSize ?? 18.sp,
              color: textColor ?? mainTextColor,
              fontWeight: fontWeight ?? FontWeight.w400,
              height: height,
            ));
  }
}
