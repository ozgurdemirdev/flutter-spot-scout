import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';
import 'package:spot_scout/widgets/core/card_container.dart';

class MaxDistance extends StatelessWidget {
  const MaxDistance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CardContainer(
        height: 6.h,
        padding: EdgeInsets.symmetric(horizontal: 1.5.h, vertical: 0.7.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            PrimaryText(
              text: "Maksimum Mesafe",
              fontSize: 16.5.sp,
              fontWeight: FontWeight.bold,
            ),
            CardContainer(
                height: 5.h,
                width: 30.w,
                color: mainColor,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.7.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Expanded(child: DistanceInput()),
                    SizedBox(
                      width: 2.w,
                    ),
                    PrimaryText(
                      text: "m",
                      textColor: secondTextColor,
                      textAlign: TextAlign.right,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600,
                    )
                  ],
                ))
          ],
        ));
  }
}

class DistanceInput extends StatelessWidget {
  const DistanceInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorHeight: 1.7.h,
      cursorColor: Colors.white70,
      decoration: InputDecoration(
        hintText: "1000",
        hintStyle: GoogleFonts.nunito(
            color: Colors.white54,
            fontSize: 16.sp,
            letterSpacing: 0,
            fontWeight: FontWeight.w500),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white60, width: 1),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white70, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 1.w,
        ),
      ),
      style: GoogleFonts.nunito(
          color: secondTextColor,
          fontSize: 16.sp,
          letterSpacing: 0,
          fontWeight: FontWeight.w500),
    );
  }
}
