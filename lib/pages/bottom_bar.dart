import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:travel_pro/constant/constant.dart';
import 'package:travel_pro/pages/favorite/favorite.dart';
import 'package:travel_pro/pages/home/home.dart';
import 'package:travel_pro/pages/hotel/hotel_list.dart';
import 'package:travel_pro/pages/profile/profile.dart';
import 'package:travel_pro/pages/trip/trip_home.dart';

class BottomBar extends StatefulWidget {
  @override
  _BottomBarState createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int currentIndex = 0;
  DateTime currentBackPressTime;

  changeIndex(index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 80.0,
        child: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              getBottomBarItemTile(0, Icons.home),
              getBottomBarItemTile(1, Icons.hotel),
              getBottomBarItemTile(2, Icons.flight_takeoff),
              getBottomBarItemTile(3, Icons.favorite),
              getBottomBarItemTile(4, Icons.person),
            ],
          ),
        ),
      ),
      body: WillPopScope(
        child: (currentIndex == 0)
            ? Homne()
            : (currentIndex == 1)
                ? HotelList()
                : (currentIndex == 2)
                    ? TripHome()
                    : (currentIndex == 3) ? Favorite() : Profile(),
        onWillPop: () async {
          bool backStatus = onWillPop();
          if (backStatus) {
            exit(0);
          }
          return false;
        },
      ),
    );
  }

  getBottomBarItemTile(int index, icon) {
    return InkWell(
      borderRadius: BorderRadius.circular(30.0),
      focusColor: primaryColor,
      onTap: () {
        changeIndex(index);
      },
      child: Container(
        height: 60.0,
        width: 60.0,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color:
              (currentIndex == index) ? Colors.grey[100] : Colors.transparent,
        ),
        child: Icon(icon,
            size: 30.0,
            color: (currentIndex == index) ? primaryColor : greyColor),
      ),
    );
  }

  onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime) > Duration(seconds: 2)) {
      currentBackPressTime = now;
      Fluttertoast.showToast(
        msg: 'Press Back Once Again to Exit.',
        backgroundColor: Colors.black,
        textColor: whiteColor,
      );
      return false;
    } else {
      return true;
    }
  }
}
