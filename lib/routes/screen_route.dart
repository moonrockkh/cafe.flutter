import 'package:cafeshop/screen/blank/blank_screen.dart';
import 'package:cafeshop/screen/cart/cart_screen.dart';
import 'package:cafeshop/screen/category/category_screen.dart';
import 'package:cafeshop/screen/checkout/checkout_screen.dart';
import 'package:cafeshop/screen/favorite/favorite_screen.dart';
import 'package:cafeshop/screen/home/home_screen.dart';
import 'package:cafeshop/screen/intro_screen/intro_screen.dart';
import 'package:cafeshop/screen/login/login_screen.dart';
import 'package:cafeshop/screen/notification/notification_screen.dart';
import 'package:cafeshop/screen/product_detail/product_detail_screen.dart';
import 'package:cafeshop/screen/profile/profile_screen.dart';
import 'package:cafeshop/screen/score/score_screen.dart';
import 'package:cafeshop/screen/setting/setting_screen.dart';
import 'package:cafeshop/screen/shop_info/shop_info_screen.dart';
import 'package:cafeshop/screen/shop_location/shop_location_screen.dart';
import 'package:cafeshop/screen/signup/signup_screen.dart';
import 'package:cafeshop/screen/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';

class RouteModel {
  String name;
  String path;
  IconData icon = Icons.navigation;
  var imageIcon;

  RouteModel({this.name, this.path, this.icon, this.imageIcon});

  Map<String, Object> getDrawerMenu() {
    var map =  Map<String, Object>();
    map['title'] = name;
    map['route'] = path;
    map['icon'] = icon;
    map['imageIcon'] = imageIcon;
    return map;
  }
}

class ScreenRouteConst {
  static RouteModel cartRoute = RouteModel(name: "Cart", path: "/cart", icon: Icons.shopping_cart);
  static RouteModel categoryRoute = RouteModel(name: "Category", path: "/category", icon: Icons.category);
  static RouteModel checkoutRoute = RouteModel(name: "Checkout", path: "/checkout", icon: Icons.attach_money);
  static RouteModel favoriteRoute = RouteModel(name: "Favorite", path: "/favorite", icon: Icons.favorite);
  static RouteModel homeRoute = RouteModel(name: "Home", path: "/home", icon: Icons.home);
  static RouteModel introRoute = RouteModel(name: "Intro", path: "/intro");
  static RouteModel loginRoute = RouteModel(name: "Login", path: "/login");
  static RouteModel notificationRoute = RouteModel(name: "Notification", path: "/notification", icon: Icons.notifications);
  static RouteModel productDetailRoute = RouteModel(name: "ProductDetail", path: "/product_detail");
  static RouteModel profileRoute = RouteModel(name: "Profile", path: "/profile", icon: Icons.person);
  static RouteModel scoreRoute = RouteModel(name: "Score", path: "/score", icon: Icons.score);
  static RouteModel settingRoute = RouteModel(name: "Setting", path: "/setting", icon: Icons.settings);
  static RouteModel shopInfoRoute = RouteModel(name: "ShopInfo", path: "/shop_info", icon: Icons.info);
  static RouteModel shopLocationRoute = RouteModel(name: "ShopLocation", path: "/shop_location", icon: Icons.location_on);
  static RouteModel signupRoute = RouteModel(name: "Signup", path: "/signup");
  static RouteModel splashScreenRoute = RouteModel(name: "SplashScreen", path: "/splash_screen");
  static RouteModel logoutRoute = RouteModel(name: "Logout", path: "/logout", icon: Icons.exit_to_app);

  // Todo: Add more page

  static get routes => <String, WidgetBuilder>{
    cartRoute.path: (BuildContext context) =>  CartScreen(),
    categoryRoute.path: (BuildContext context) => CategoryScreen(),
    checkoutRoute.path: (BuildContext context) => CheckoutScreen(),
    favoriteRoute.path: (BuildContext context) => FavoriteScreen(),
    homeRoute.path: (BuildContext context) => HomeScreen(),
    introRoute.path: (BuildContext context) => IntroScreen(),
    loginRoute.path: (BuildContext context) => LoginScreen(),
    notificationRoute.path: (BuildContext context) => NotificationScreen(),
    productDetailRoute.path: (BuildContext context) => ProductDetailScreen(),
    profileRoute.path: (BuildContext context) => ProfileScreen(),
    scoreRoute.path: (BuildContext context) => ScoreScreen(),
    settingRoute.path: (BuildContext context) => SettingScreen(),
    shopInfoRoute.path: (BuildContext context) => ShopInfoScreen(),
    shopLocationRoute.path: (BuildContext context) => ShopLocationScreen(),
    signupRoute.path: (BuildContext context) => SignupScreen(),
    splashScreenRoute.path: (BuildContext context) => SplashScreen()
  };
  static get unknownRoute => (RouteSettings routeSetting) {
    return MaterialPageRoute(builder: (context) => BlankScreen());
  };
}
