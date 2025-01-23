import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:spot_scout/settings.dart';
import 'package:spot_scout/widgets/main/place/place_item.dart';

int selectedPlaceIndex = -1;

GlobalKey<_PlaceListState> globalPlaceList = GlobalKey<_PlaceListState>();

class PlaceList extends StatefulWidget {
  const PlaceList({
    super.key,
  });

  @override
  State<PlaceList> createState() => _PlaceListState();
}

class _PlaceListState extends State<PlaceList> {
  void refreshState() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: allPlaces.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          String iconName = allPlaces[index][0];
          String placeName = allPlaces[index][1];
          bool selected = (selectedPlaceIndex == index) ? true : false;
          return Row(
            children: [
              PlaceItem(
                iconName: iconName,
                name: placeName,
                isSelected: selected,
                index: index,
              ),
              SizedBox(
                width: 4.5.w,
              ),
            ],
          );
        });
  }
}
