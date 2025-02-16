// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/models/selected_place_model.dart';
import 'package:spot_scout/services/get_place_distance_api.dart';
import 'package:spot_scout/widgets/detail/info/info_box.dart';
import 'package:spot_scout/widgets/detail/work_status/work_status_list.dart';
import 'package:url_launcher/url_launcher.dart';

class ListInfoBox extends StatelessWidget {
  const ListInfoBox({
    super.key,
    required this.address,
    required this.phone,
    required this.distance,
    required this.minute,
    required this.openingHours,
    required this.placeID,
  });
  final String address;
  final String phone;
  final DistanceResult distance;
  final int minute;
  final OpeningHours? openingHours;
  final String placeID;
  @override
  Widget build(BuildContext context) {
    int meter = distance.distanceMeters;
    String distanceMeter =
        meter < 1000 ? '$meter m' : '${(meter / 1000).toStringAsFixed(1)}  km';
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            InfoBox(
              height: 6.h,
              title: "Adres",
              iconName: "location",
              info: address,
            ),
            OpenMapButton(
              placeId: placeID,
            ),
          ],
        ),
        SizedBox(
          height: 3.h,
        ),
        InfoBox(
          title: "Telefon No.",
          iconName: "phone",
          info: phone.isEmpty ? "Bilinmiyor" : phone,
        ),
        SizedBox(
          height: 3.h,
        ),
        InfoBox(
          title: "Uzaklık",
          iconName: "distance",
          info: '$distanceMeter / ${distance.durationMinutes} dk',
        ),
        SizedBox(
          height: 3.h,
        ),
        WorkStatusList(
          openingHours: openingHours,
        ),
      ],
    );
  }
}

class OpenMapButton extends StatelessWidget {
  final String placeId;

  const OpenMapButton({super.key, required this.placeId});

  Future<void> _openInGoogleMaps() async {
    final Uri googleMapsUrl = Uri.parse(
        "https://www.google.com/maps/search/?api=1&query=Google&query_place_id=$placeId");

    if (await canLaunchUrl(googleMapsUrl)) {
      await launchUrl(googleMapsUrl);
    } else {
      throw 'Google Maps açılamadı';
    }
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _openInGoogleMaps,
      child: Image.asset(
        "assets/images/icons/google_maps.png",
        fit: BoxFit.contain,
      ),
    );
  }
}
