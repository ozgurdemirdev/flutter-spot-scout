import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/models/template/nearby_places_temp.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';
import 'package:spot_scout/widgets/main/nearby_places/nearby_place_item.dart';

class NearbyPlacesList extends StatelessWidget {
  const NearbyPlacesList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<NearbyPlaceItem> places = generateTempList();
    return Expanded(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 1.h,
            ),
            PrimaryText(
              text: "Size En Yakın",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 1.h,
            ),
            const NearbyPlaceItem(
              imageLink: "assets/images/template/place_1.png",
              placeName: "Şok Market",
              placeDistance: "667 m",
              placeClosingTime: "21:30",
              placeScore: 3.4,
              placeType: "market",
            ),
            SizedBox(
              height: 2.h,
            ),
            PrimaryText(
              text: "Tüm Yakın Mekanlar",
              fontSize: 16.sp,
              fontWeight: FontWeight.bold,
            ),
            SizedBox(
              height: 1.h,
            ),
            ListView(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              children: places
                  .map((place) => Column(
                        children: [
                          NearbyPlaceItem(
                            imageLink: place.imageLink,
                            placeName: place.placeName,
                            placeDistance: place.placeDistance,
                            placeClosingTime: place.placeClosingTime,
                            placeScore: place.placeScore,
                            placeType: place.placeType,
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                        ],
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
