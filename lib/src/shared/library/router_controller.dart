import 'package:flutter/material.dart';
import 'package:remedio_da_hora/src/interfaces/lib/router_controller_interface.dart';
import 'package:remedio_da_hora/src/screens/home/home_screen.dart';

class RouterController implements IRouterController {
  @override
  String get initialRoute => routes.keys.first;

  final Map<String, Widget Function(BuildContext context)> _routes = {
    '/': (context) => HomeScreen(),
  };

  @override
  void registerRoute(String routeName, Widget destination) {
    _routes[routeName] = (context) => destination;
  }

  @override
  Map<String, Widget Function(BuildContext p1)> get routes => _routes;
  
  @override
  void registerAllRoutes(
      Map<String, Widget Function(BuildContext context)> routes) {
    _routes.addAll(routes);
  }
}
