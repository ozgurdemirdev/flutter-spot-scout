import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spot_scout/models/selected_place_model.dart';
import 'package:spot_scout/settings.dart';

Future<SelectedPlaceData?> fetchGetPlace(String placeID) async {
  final String url = 'https://maps.googleapis.com/maps/api/place/details/json?'
      'language=tr'
      '&place_id=$placeID'
      '&key=$googlePlaceApiKey';

  final response = await http.get(Uri.parse(url));
  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    return SelectedPlaceData.fromJson(data);
  } else {
    return null;
  }
}
