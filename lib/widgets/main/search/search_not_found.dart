import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';

class SearchNotFound extends StatelessWidget {
  const SearchNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          SizedBox(
            height: 4.h,
          ),
          PrimaryText(
            text: "Bu Mesafede Bir Mekan Bulamadık",
            fontSize: 18.sp,
            fontWeight: FontWeight.w900,
            textColor: errorColor,
          ),
          PrimaryText(
            text: "Mesafeyi arttırıp tekrar deneyin",
            fontSize: 15.sp,
            fontWeight: FontWeight.w400,
          ),
          Expanded(
              child: Center(
                  child: Image.asset("assets/images/general/not_found.png")))
        ],
      ),
    );
  }
}
