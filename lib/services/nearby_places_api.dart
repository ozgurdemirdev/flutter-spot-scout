import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spot_scout/models/places_model.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/utils/get_user_location.dart';

String userPosition = "0,0";
Future<AllPlacesData?> fetchNearbyGetPlaces(String type, int distance) async {
  userPosition = await getUserPosition();

  final String url =
      'https://maps.googleapis.com/maps/api/place/nearbysearch/json?'
      'location=$userPosition'
      '&radius=$distance'
      '&type=$type'
      '&key=$googlePlaceApiKey';
  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return AllPlacesData.fromJson(data);
  } else {
    return null;
  }
}
