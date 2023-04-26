import 'package:flutter/material.dart';

abstract class IRouterController {
  String get initialRoute;

  Map<String, Widget Function(BuildContext)> get routes;

  void registerRoute(String routeName, Widget destination);

  void registerAllRoutes(Map<String, Widget Function(BuildContext)> routes);
}
