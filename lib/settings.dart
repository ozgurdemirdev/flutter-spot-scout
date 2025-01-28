import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

const String googlePlaceApiKey = "AIzaSyADd4cuSv13TkwFVwE7nF0bsTXiE5HhumM";
//Default Values
int searchDistance = 300;
int searchOpenNow = 2;
String searchType = "";

const Color mainColor = Color.fromRGBO(252, 173, 93, 1);
const Color mainColorSoft = Color.fromRGBO(255, 211, 168, 1);
const Color appBgColor = Color.fromRGBO(255, 201, 111, 1);
const Color mainBgColor = Color.fromRGBO(244, 244, 244, 1);
const Color secondBgColor = Color.fromRGBO(255, 255, 255, 1);
const Color mainTextColor = Color.fromRGBO(24, 24, 24, 1);
const Color secondTextColor = Color.fromRGBO(244, 244, 244, 1);
const Color errorColor = Color.fromRGBO(247, 85, 88, 1);
const Color successColor = Color.fromRGBO(98, 214, 88, 1);
const Color warningColor = Color.fromRGBO(250, 203, 74, 1);

const Color starActiveColor = Color.fromRGBO(253, 198, 10, 1);
const Color starPasiveColor = Color.fromRGBO(200, 200, 200, 1);

const Color iconMarketColor = Color.fromRGBO(229, 99, 77, 1);
const Color iconRestaurantColor = Color.fromRGBO(88, 214, 141, 1);
const Color iconCafeColor = Color.fromRGBO(242, 94, 192, 1);
const Color iconTaxiColor = Color.fromRGBO(253, 198, 10, 1);
const Color iconPharmacyColor = Color.fromRGBO(255, 57, 61, 1);
const Color iconParkingColor = Color.fromRGBO(57, 166, 255, 1);
const Color iconPhoneColor = Color.fromRGBO(57, 166, 255, 1);
const Color iconLocationColor = Color.fromRGBO(88, 214, 141, 1);
const Color iconDistanceColor = Color.fromRGBO(253, 198, 10, 1);
const Color iconTimeColor = Color.fromRGBO(242, 94, 192, 1);

final Map<String, Color> iconColors = {
  'supermarket': iconMarketColor,
  'restaurant': iconRestaurantColor,
  'cafe': iconCafeColor,
  'taxi_stand': iconTaxiColor,
  'pharmacy': iconPharmacyColor,
  'parking': iconParkingColor,
  'phone': iconPhoneColor,
  'location': iconLocationColor,
  'distance': iconDistanceColor,
  'time': iconTimeColor,
};

final List<List> allPlaces = [
  ["supermarket", "Market"],
  ["restaurant", "Restoran"],
  ["cafe", "Kafe"],
  ["taxi_stand", "Taksi"],
  ["pharmacy", "Eczane"],
  ["parking", "Otopark"],
];

double mainPadding = 1.5.h;
double innerPaddingH = 5.h;
double innerPaddingW = 3.w;
/*Üst kısımda ki boşluğu ayarlamak için gereken değişken.
  Bazı widgetların üstten gelen boşluğunu kolaylıkla değiştirmek için kullandım. */
double mainTopDistance = 19.5.h;
double secondTopDistance = 26.5.h;

Radius mainBgRadius = const Radius.circular(20);
Radius mainRadius = const Radius.circular(15);
Radius cardRadius = const Radius.circular(10);
double cardRadiusD = 10;
