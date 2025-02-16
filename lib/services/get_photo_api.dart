import 'package:http/http.dart' as http;
import 'package:spot_scout/settings.dart';

Future<String?> fetchPlacePhotoUrl(String photoReference) async {
  final url =
      'https://maps.googleapis.com/maps/api/place/photo?maxwidth=400&photo_reference=$photoReference&key=$googlePlaceApiKey';

  try {
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      return url;
    } else {
      return null;
    }
  } catch (e) {
    return null;
  }
}
