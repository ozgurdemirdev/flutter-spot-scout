// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/screens/main_screen.dart';
import 'package:spot_scout/settings.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, screenType) {
      return MaterialApp(
        theme: ThemeData(colorSchemeSeed: mainColor),
        debugShowCheckedModeBanner: false,
        home: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {},
          child: Scaffold(
            backgroundColor: appBgColor,
            body: SafeArea(child: MainScreen()),
          ),
        ),
      );
    });
  }
}
