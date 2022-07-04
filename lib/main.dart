import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:travel_pro/constant/constant.dart';
import 'package:travel_pro/pages/home/home.dart';
import 'package:travel_pro/pages/splashScreen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]).then((_) {
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Travel Pro',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          primaryColor: primaryColor,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Noto Sans',
          textSelectionTheme: TextSelectionThemeData(
            cursorColor: primaryColor,
          ),
          iconTheme: IconThemeData(
            color: blackColor,
          ),
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(
            color: blackColor,
          ))).copyWith(
        pageTransitionsTheme: PageTransitionsTheme(
          builders: <TargetPlatform, PageTransitionsBuilder>{
            TargetPlatform.android: ZoomPageTransitionsBuilder(),
          },
        ),
      ),
      debugShowCheckedModeBanner: false,
      home: Homne(),
    );
  }
}
