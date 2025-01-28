import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/main/max_distance.dart';
import 'package:spot_scout/widgets/main/nearby_places/nearby_places_list.dart';
import 'package:spot_scout/widgets/main/place/select_place.dart';
import 'package:spot_scout/widgets/main/search/search_widget.dart';
import 'package:spot_scout/widgets/main/top_bg_image.dart';
import 'package:spot_scout/widgets/main/top_text.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      width: 100.w,
      child: Stack(
        children: [
          const TopBgImage(),
          Positioned.fill(
            top: mainTopDistance,
            child: Container(
              padding: EdgeInsets.only(
                  left: mainPadding,
                  right: mainPadding,
                  top: mainTopDistance - 13.5.h),
              decoration: BoxDecoration(
                  color: mainBgColor,
                  borderRadius: BorderRadius.only(
                      topLeft: mainBgRadius, topRight: mainBgRadius)),
              child: Column(
                children: [
                  const MaxDistance(),
                  SizedBox(
                    height: 1.7.h,
                  ),
                  /*const WorkStatus(),
                  SizedBox(
                    height: 1.7.h,
                  ),
                  */
                  const SelectPlace(),
                  SizedBox(
                    height: 1.h,
                  ),
                  Expanded(
                      child: SearchAll(
                    key: nearbyPlaceListGlobal,
                  ))
                ],
              ),
            ),
          ),
          const TopText(),
        ],
      ),
    );
  }
}

GlobalKey<_SearchAllState> nearbyPlaceListGlobal = GlobalKey<_SearchAllState>();

class SearchAll extends StatefulWidget {
  const SearchAll({
    super.key,
  });

  @override
  State<SearchAll> createState() => _SearchAllState();
}

class _SearchAllState extends State<SearchAll> {
  void refreshWidget() {
    setState(() {
      isLoading = false;
    });
  }

  void changeLoading(bool loading) {
    setState(() {
      isLoading = loading;
    });
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        !isLoading
            ? (searchType == ""
                ? const SearchWidget()
                : const NearbyPlacesList())
            : const Center(
                child: CircularProgressIndicator(),
              ),
      ],
    );
  }
}
