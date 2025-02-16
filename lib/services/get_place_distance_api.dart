import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spot_scout/services/nearby_places_api.dart';
import 'package:spot_scout/settings.dart';

class DistanceResult {
  final int distanceMeters;
  final int durationMinutes;

  DistanceResult({required this.distanceMeters, required this.durationMinutes});
}

Future<DistanceResult?> getWalkingDistanceAndTime(String placeID) async {
  final String url = 'https://maps.googleapis.com/maps/api/distancematrix/json?'
      'origins=$userPosition'
      '&destinations=place_id:$placeID'
      '&mode=walking' // Yürüyüş modu
      '&key=$googlePlaceApiKey';

  final response = await http.get(Uri.parse(url));

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    if (data['rows'][0]['elements'][0]['status'] == "OK") {
      // Mesafeyi metre olarak al
      int distanceMeters = data['rows'][0]['elements'][0]['distance']
          ['value']; // Metre cinsinden

      // Süreyi dakika olarak al
      String durationText = data['rows'][0]['elements'][0]['duration']['text'];
      int durationMinutes =
          int.parse(durationText.split(' ')[0]); // "15 mins" -> "15"

      return DistanceResult(
          distanceMeters: distanceMeters, durationMinutes: durationMinutes);
    }
  }
  return null;
}
