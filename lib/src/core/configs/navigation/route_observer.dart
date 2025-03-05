import 'package:flutter/material.dart';
import 'package:igameapp/src/core/configs/navigation/route_setting.dart';
import 'package:igameapp/src/core/di/getit/injection.dart';

class MyRouteObserver extends RouteObserver<PageRoute> {
  @override
  void didPush(Route route, Route? previousRoute) {
    getIt<RouteSettingsService>().currentRouteSettings = route.settings;
    print("didPush_${getIt<RouteSettingsService>().currentRouteSettings?.arguments}");
    super.didPush(route, previousRoute);
  }

  @override
  void didReplace({Route? newRoute, Route? oldRoute}) {
    getIt<RouteSettingsService>().currentRouteSettings = newRoute?.settings;
    print("didReplace${getIt<RouteSettingsService>().currentRouteSettings?.arguments}");
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    getIt<RouteSettingsService>().currentRouteSettings = null; // Clear on pop
    print("didPop${getIt<RouteSettingsService>().currentRouteSettings?.arguments}");
    super.didPop(route, previousRoute);
  }
}
