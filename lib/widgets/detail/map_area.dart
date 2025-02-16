// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/core/card_container.dart';

class MapArea extends StatefulWidget {
  const MapArea({
    super.key,
    required this.userLocation,
    required this.placeLocation,
  });

  final LatLng userLocation;
  final LatLng placeLocation;

  @override
  State<MapArea> createState() => _MapAreaState();
}

class _MapAreaState extends State<MapArea> {
  late GoogleMapController mapController;
  Set<Marker> _markers = {};
  Set<Polyline> _polylines = {};

  void refreshMapArea() {
    setState(() {
      _setupMarkers();
      _getRoute();
    });
  }

  @override
  void initState() {
    super.initState();
    _setupMarkers();
    _getRoute();
  }

  void _setupMarkers() {
    _markers.addAll([
      Marker(
        markerId: MarkerId('userLocation'),
        position: widget.userLocation,
        infoWindow: InfoWindow(title: 'Siz Buradasınız'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueBlue),
      ),
      Marker(
        markerId: MarkerId('placeLocation'),
        position: widget.placeLocation,
        infoWindow: InfoWindow(title: 'Mekan'),
        icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueRed),
      ),
    ]);
  }

  Future<void> _getRoute() async {
    final String url =
        'https://maps.googleapis.com/maps/api/directions/json?origin=${widget.userLocation.latitude},${widget.userLocation.longitude}&destination=${widget.placeLocation.latitude},${widget.placeLocation.longitude}&mode=walking&key=$googlePlaceApiKey';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (data['routes'].isNotEmpty) {
        final points = data['routes'][0]['overview_polyline']['points'];
        final List<LatLng> routeCoords = _decodePolyline(points);

        setState(() {
          _polylines.add(
            Polyline(
              polylineId: PolylineId('walking_route'),
              color: Colors.blue,
              width: 5,
              points: routeCoords,
            ),
          );
        });
      }
    } else {
      print('Rota alınamadı: ${response.reasonPhrase}');
    }
  }

  List<LatLng> _decodePolyline(String encoded) {
    List<LatLng> polylineCoordinates = [];
    int index = 0, len = encoded.length;
    int lat = 0, lng = 0;

    while (index < len) {
      int b, shift = 0, result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlat = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lat += dlat;

      shift = 0;
      result = 0;
      do {
        b = encoded.codeUnitAt(index++) - 63;
        result |= (b & 0x1f) << shift;
        shift += 5;
      } while (b >= 0x20);
      int dlng = (result & 1) != 0 ? ~(result >> 1) : (result >> 1);
      lng += dlng;

      polylineCoordinates.add(LatLng(lat / 1e5, lng / 1e5));
    }

    return polylineCoordinates;
  }

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      height: 20.h,
      width: 100.w,
      child: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: widget.userLocation,
          zoom: 15.0,
        ),
        markers: _markers,
        polylines: _polylines,
      ),
    );
  }
}
