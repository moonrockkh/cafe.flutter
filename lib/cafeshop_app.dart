import 'package:cafeshop/constant/app_const.dart';
import 'package:cafeshop/routes/screen_route.dart';
import 'package:flutter/material.dart';

import 'package:cafeshop/screen/splash_screen/splash_screen.dart';

class CafeShop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppConst.APP_NAME,
      debugShowCheckedModeBanner: AppConst.APP_PRODUCTION_MODE ? false : true,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: ScreenRouteConst.routes,
      onUnknownRoute: ScreenRouteConst.unknownRoute,
      home: SplashScreen(),
    );
  }
}