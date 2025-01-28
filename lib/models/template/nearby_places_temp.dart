import 'package:spot_scout/widgets/main/nearby_places/nearby_place_item.dart';

List<NearbyPlaceItem> generateTempList() {
  return [
    NearbyPlaceItem(
      imageLink: "assets/images/template/place_1.png",
      placeName: "Şok Market",
      placeDistance: 100,
      placeScore: 3.4,
      isOpen: false,
      placeType: "supermarket",
    ),
  ];
}
