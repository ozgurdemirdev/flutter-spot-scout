import 'dart:math';

import 'package:spot_scout/widgets/main/place/place_item.dart';

class AllPlacesData {
  AllPlacesData({
    required this.htmlAttributions,
    required this.places,
    required this.status,
  });

  final List<dynamic> htmlAttributions;
  final List<Places> places;
  final String? status;

  factory AllPlacesData.fromJson(Map<String, dynamic> json) {
    return AllPlacesData(
      htmlAttributions: json["html_attributions"] == null
          ? []
          : List<dynamic>.from(json["html_attributions"]!.map((x) => x)),
      places: json["results"] == null
          ? []
          : List<Places>.from(json["results"]!.map((x) => Places.fromJson(x))),
      status: json["status"],
    );
  }

  Map<String, dynamic> toJson() => {
        "html_attributions": htmlAttributions.map((x) => x).toList(),
        "results": places.map((x) => x.toJson()).toList(),
        "status": status,
      };
}

class Places {
  Places({
    required this.geometry,
    required this.name,
    required this.openingHours,
    required this.photos,
    required this.placeId,
    required this.rating,
    required this.types,
    required this.vicinity,
  });

  final Geometry? geometry;
  final String? name;
  final OpeningHours? openingHours;
  final List<Photo> photos;
  final String? placeId;
  final double? rating;
  final List<String> types;
  final String? vicinity;

  factory Places.fromJson(Map<String, dynamic> json) {
    return Places(
      geometry:
          json["geometry"] == null ? null : Geometry.fromJson(json["geometry"]),
      name: json["name"] ?? "",
      openingHours: json["opening_hours"] == null
          ? OpeningHours(openNow: null)
          : OpeningHours.fromJson(json["opening_hours"]),
      photos: json["photos"] == null
          ? []
          : List<Photo>.from(json["photos"]!.map((x) => Photo.fromJson(x))),
      placeId: json["place_id"],
      rating: (json["rating"] ?? 0 as num).toDouble(),
      types: json["types"] == null
          ? []
          : List<String>.from(json["types"]!.map((x) => x)),
      vicinity: json["vicinity"],
    );
  }

  Map<String, dynamic> toJson() => {
        "geometry": geometry?.toJson(),
        "name": name,
        "opening_hours": openingHours?.toJson(),
        "photos": photos.map((x) => x.toJson()).toList(),
        "place_id": placeId,
        "rating": rating,
        "types": types.map((x) => x).toList(),
        "vicinity": vicinity,
      };
}

class Geometry {
  Geometry({
    required this.location,
  });

  final Location? location;

  factory Geometry.fromJson(Map<String, dynamic> json) {
    return Geometry(
      location: json["location"] == null
          ? null
          : Location.fromJson(json["location"], userLocation),
    );
  }

  Map<String, dynamic> toJson() => {
        "location": location?.toJson(),
      };
}

class Location {
  Location({
    required this.lat,
    required this.lng,
    this.distance = 0.0,
  });

  final double? lat;
  final double? lng;
  double? distance;

  // Mesafe hesaplamak için Haversine formülü
  static double calcDistance(
      double? lat1, double? lng1, double? lat2, double? lng2) {
    if (lat1 == null || lng1 == null || lat2 == null || lng2 == null) {
      return 0.0;
    }

    const R = 6371; // Dünya'nın yarıçapı (km cinsinden)
    double lat1Rad = lat1 * pi / 180;
    double lat2Rad = lat2 * pi / 180;
    double deltaLat = (lat2 - lat1) * pi / 180;
    double deltaLng = (lng2 - lng1) * pi / 180;

    double a = sin(deltaLat / 2) * sin(deltaLat / 2) +
        cos(lat1Rad) * cos(lat2Rad) * sin(deltaLng / 2) * sin(deltaLng / 2);
    double c = 2 * atan2(sqrt(a), sqrt(1 - a));

    return R * c * 1000; // Sonuç metre cinsindendir
  }

  factory Location.fromJson(Map<String, dynamic> json, Location userLocation) {
    double lat = json["lat"];
    double lng = json["lng"];

    // Mesafeyi hesapla
    double distance =
        calcDistance(userLocation.lat, userLocation.lng, lat, lng);

    return Location(
      lat: lat,
      lng: lng,
      distance: distance,
    );
  }

  Map<String, dynamic> toJson() => {
        "lat": lat,
        "lng": lng,
      };
}

class OpeningHours {
  OpeningHours({
    required this.openNow,
  });

  final bool? openNow;

  factory OpeningHours.fromJson(Map<String, dynamic> json) {
    return OpeningHours(
      openNow: json["open_now"],
    );
  }

  Map<String, dynamic> toJson() => {
        "open_now": openNow,
      };
}

class Photo {
  Photo({
    required this.height,
    required this.htmlAttributions,
    required this.photoReference,
    required this.width,
  });

  final int? height;
  final List<String> htmlAttributions;
  final String? photoReference;
  final int? width;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      height: json["height"],
      htmlAttributions: json["html_attributions"] == null
          ? []
          : List<String>.from(json["html_attributions"]!.map((x) => x)),
      photoReference: json["photo_reference"],
      width: json["width"],
    );
  }

  Map<String, dynamic> toJson() => {
        "height": height,
        "html_attributions": htmlAttributions.map((x) => x).toList(),
        "photo_reference": photoReference,
        "width": width,
      };
}
