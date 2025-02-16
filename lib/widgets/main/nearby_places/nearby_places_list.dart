import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/models/places_model.dart';
import 'package:spot_scout/services/nearby_places_api.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/primary_dropdown.dart';
import 'package:spot_scout/widgets/core/primary_text.dart';
import 'package:spot_scout/widgets/main/max_distance.dart';
import 'package:spot_scout/widgets/main/nearby_places/nearby_place_item.dart';
import 'package:spot_scout/widgets/main/search/search_not_found.dart';

class NearbyPlacesList extends StatefulWidget {
  const NearbyPlacesList({
    super.key,
  });

  @override
  State<NearbyPlacesList> createState() => _NearbyPlacesListState();
}

class _NearbyPlacesListState extends State<NearbyPlacesList> {
  void refreshWidget() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<AllPlacesData?>(
        future: fetchNearbyGetPlaces(searchType,
            int.tryParse(distanceInputController.text) ?? searchDistance),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Padding(
                  padding: EdgeInsets.only(top: 2.h),
                  child: const CircularProgressIndicator()),
            );
          }
          if (snapshot.hasError) {
            return const NearbyNotFound();
          }
          if (snapshot.hasData) {
            AllPlacesData? nearbyPlaces = snapshot.data;
            if (nearbyPlaces == null || nearbyPlaces.places.isEmpty) {
              return const NearbyNotFound();
            }

            nearbyPlaces.places.sort((a, b) {
              double distanceA =
                  a.geometry?.location?.distance ?? double.infinity;
              double distanceB =
                  b.geometry?.location?.distance ?? double.infinity;
              return distanceA.compareTo(distanceB);
            });

            if (selectedDropItem != 0) {
              bool openNow = selectedDropItem == 1 ? true : false;
              nearbyPlaces.places.removeWhere(
                  (place) => place.openingHours!.openNow != openNow);
            }

            Places firstPlace = nearbyPlaces.places[0];
            if (nearbyPlaces.places.length > 1) {
              nearbyPlaces.places.removeAt(0);
            }

            if (nearbyPlaces.places.isEmpty) {
              return const NearbyNotFound();
            }

            return SingleChildScrollView(
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
                  NearbyPlaceItem(
                    imageLink: "",
                    placeName: firstPlace.name!,
                    placeDistance:
                        firstPlace.geometry!.location!.distance!.toInt(),
                    placeScore: firstPlace.rating ?? 0,
                    isOpen: firstPlace.openingHours!.openNow,
                    placeType: searchType,
                    placeID: firstPlace.placeId ?? "",
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
                      children: nearbyPlaces.places
                          .map((place) => Column(
                                children: [
                                  NearbyPlaceItem(
                                    imageLink: "",
                                    placeName: place.name!,
                                    placeDistance: place
                                        .geometry!.location!.distance!
                                        .toInt(),
                                    placeScore: place.rating ?? 0,
                                    isOpen: place.openingHours!.openNow,
                                    placeType: searchType,
                                    placeID: place.placeId ?? "",
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                ],
                              ))
                          .toList()),
                ],
              ),
            );
          } else {
            return const NearbyNotFound();
          }
        });
  }
}

class NearbyNotFound extends StatelessWidget {
  const NearbyNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SearchNotFound(
      title: "Bu Mesafede Bir Mekan Bulamadık",
      secondTitle: "Mesafeyi arttırıp tekrar deneyin",
    );
  }
}
