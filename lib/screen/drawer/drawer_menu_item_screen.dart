import 'package:cafeshop/routes/screen_route.dart';

List<Map<String, Object>> drawerMenuItems = [
  ScreenRouteConst.profileRoute.getDrawerMenu(),
  ScreenRouteConst.cartRoute.getDrawerMenu(),
  ScreenRouteConst.checkoutRoute.getDrawerMenu(),
  ScreenRouteConst.scoreRoute.getDrawerMenu(),
  ScreenRouteConst.settingRoute.getDrawerMenu(),
  ScreenRouteConst.shopInfoRoute.getDrawerMenu(),
  ScreenRouteConst.shopLocationRoute.getDrawerMenu(),
  ScreenRouteConst.loginRoute.getDrawerMenu(),
  ScreenRouteConst.logoutRoute.getDrawerMenu()
];