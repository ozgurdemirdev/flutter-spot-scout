import 'package:flutter/material.dart';
import 'package:spot_scout/screens/detail_screen.dart';

void openDetailScreen(BuildContext context, String placeID, String placeType) {
  Navigator.push(
    context,
    MaterialPageRoute(
        builder: (context) => DetailScreen(
              placeID: placeID,
              placeType: placeType,
            )),
  );
}
