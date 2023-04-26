import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:remedio_da_hora/src/shared/library/navigator_controller.dart';
import 'package:remedio_da_hora/src/shared/library/router_controller.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';

class DahoraApp extends StatefulWidget {
  @override
  State<DahoraApp> createState() => _DahoraAppState();
}

class _DahoraAppState extends State<DahoraApp> {
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey();

  @override
  void initState() {
    singNavigator.setNavigatorKey(_navigatorKey);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        locale: const Locale("pt", "BR"),
        navigatorKey: _navigatorKey,
        initialRoute: '/',
        routes: singRoutes.routes);
  }
}
