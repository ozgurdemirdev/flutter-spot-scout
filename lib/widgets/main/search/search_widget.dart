import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 4.h,
        ),
        PrimaryText(
          text: "Sizin İçin Doğru Yeri Bulalım",
          fontSize: 18.sp,
          fontWeight: FontWeight.w900,
        ),
        Expanded(
            child: Center(
                child: Image.asset("assets/images/general/search_main.png")))
      ],
    );
  }
}
