import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:spot_scout/models/places_model.dart';

Future<bool> getUserPerm() async {
  bool? reqPerm;
  var perm = await Permission.location.status;
  if (!perm.isGranted) {
    await Permission.location.onDeniedCallback(() {
      reqPerm = false;
    }).onGrantedCallback(() {
      reqPerm = true;
    }).request();
  }
  return reqPerm ?? perm.isGranted;
}

Future<String> getUserPosition() async {
  Position userPosition = await Geolocator.getCurrentPosition();
  double latitude = userPosition.latitude;
  double longitude = userPosition.longitude;
  return "$latitude,$longitude";
}

Future<Location> getUserLocation() async {
  Position pos = await Geolocator.getCurrentPosition();
  double latitude = pos.latitude;
  double longitude = pos.longitude;
  Location userLoc = Location(lat: latitude, lng: longitude);
  return userLoc;
}
