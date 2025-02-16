// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/models/selected_place_model.dart';
import 'package:spot_scout/services/get_photo_api.dart';
import 'package:spot_scout/services/get_place_api.dart';
import 'package:spot_scout/services/get_place_distance_api.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/card_container.dart';
import 'package:spot_scout/widgets/detail/detail_image_list.dart';
import 'package:spot_scout/widgets/detail/info/list_info_box.dart';
import 'package:spot_scout/widgets/detail/map_area.dart';
import 'package:spot_scout/widgets/detail/top_name_tag.dart';
import 'package:spot_scout/widgets/main/place/place_item.dart';
import 'package:spot_scout/widgets/main/search/search_not_found.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({
    super.key,
    required this.placeID,
    required this.placeType,
  });
  final String placeID;
  final String placeType;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appBgColor,
      body: SafeArea(
        child: SizedBox(
          height: 100.h,
          width: 100.w,
          child: FutureBuilder(
              future: Future.wait([
                fetchGetPlace(widget.placeID),
                getWalkingDistanceAndTime(widget.placeID)
              ]),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(
                    child: Padding(
                        padding: EdgeInsets.only(top: 2.h),
                        child: const CircularProgressIndicator()),
                  );
                }
                if (snapshot.hasError) {
                  return Center(
                    child: const PlaceNotFound(),
                  );
                }
                if (snapshot.hasData) {
                  SelectedPlaceData? selectedPlaceAll =
                      snapshot.data![0] as SelectedPlaceData;

                  DistanceResult? placeDistance =
                      snapshot.data![1] as DistanceResult;

                  if (selectedPlaceAll.selectedPlace == null) {
                    return const PlaceNotFound();
                  }
                  SelectedPlace? place = selectedPlaceAll.selectedPlace;
                  return Stack(
                    children: [
                      SizedBox(
                        height: 30.h,
                        width: 100.w,
                        child: (place!.photos.isNotEmpty)
                            ? FutureBuilder<String?>(
                                future: fetchPlacePhotoUrl(
                                    place.photos[0].photoReference ?? ""),
                                builder: (context, snapshot) {
                                  return DetailImageList(
                                    imageLink: snapshot.data ?? "",
                                    placeType: widget.placeType,
                                  );
                                })
                            : DetailImageList(
                                imageLink: "",
                                placeType: widget.placeType,
                              ),
                      ),
                      Positioned(top: 1.h, left: 1.h, child: BackIcon()),
                      Positioned.fill(
                        top: secondTopDistance,
                        child: Container(
                          padding: EdgeInsets.only(
                              left: mainPadding,
                              right: mainPadding,
                              top: secondTopDistance - 20.h),
                          decoration: BoxDecoration(
                              color: mainBgColor,
                              borderRadius: BorderRadius.only(
                                  topLeft: mainBgRadius,
                                  topRight: mainBgRadius)),
                          child: Column(
                            children: [
                              MapArea(
                                userLocation: LatLng(userLocation.lat ?? 0,
                                    userLocation.lng ?? 0),
                                placeLocation: LatLng(
                                    place.geometry!.location!.lat ?? 0,
                                    place.geometry!.location!.lng ?? 0),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Expanded(
                                  child: ListInfoBox(
                                placeID: place.placeId ?? "",
                                address: place.formattedAddress ?? "",
                                phone: place.formattedPhoneNumber ?? "",
                                distance: placeDistance,
                                minute: 3,
                                openingHours: place.openingHours,
                              ))
                            ],
                          ),
                        ),
                      ),
                      TopNameTag(
                        name: place.name ?? "",
                        isOpen: place.openingHours?.openNow,
                        rating: place.rating ?? 0,
                        placeType: widget.placeType,
                      )
                    ],
                  );
                } else {
                  return const PlaceNotFound();
                }
              }),
        ),
      ),
    );
  }
}

class PlaceNotFound extends StatelessWidget {
  const PlaceNotFound({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(left: 5.w, top: 5.w, child: BackIcon()),
        Center(
          child: Padding(
            padding: EdgeInsets.only(left: 5.w, right: 5.w),
            child: CardContainer(
              width: 100.w,
              height: 40.h,
              child: const SearchNotFound(
                title: "Bu Mekanın Bilgilerine Ulaşamadık",
                secondTitle: "Lütfen başka bir mekan seçin",
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BackIcon extends StatelessWidget {
  const BackIcon({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.5.h,
      width: 4.5.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: Colors.black26,
      ),
      child: Center(
        child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
              size: 2.5.h,
            )),
      ),
    );
  }
}
