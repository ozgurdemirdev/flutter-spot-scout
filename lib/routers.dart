import 'package:flutter/material.dart';
import 'package:spot_scout/screens/detail_screen.dart';

void OpenDetailScreen(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const DetailScreen()),
  );
}
