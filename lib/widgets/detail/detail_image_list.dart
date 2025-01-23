// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class DetailImageList extends StatelessWidget {
  const DetailImageList({super.key, required this.imageLink});
  final String imageLink;
  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imageLink,
      fit: BoxFit.cover,
    );
  }
}
