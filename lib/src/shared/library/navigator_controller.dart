import 'package:flutter/material.dart';
import 'package:remedio_da_hora/src/screens/home/home_screen.dart';

class NavigatorController {
  NavigatorController._();
  factory NavigatorController() => instance;
  static final NavigatorController instance = NavigatorController._();

  late GlobalKey<NavigatorState> _navigatorKey;

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  BuildContext get currentContext =>
      _navigatorKey.currentState!.overlay!.context;

  late Map<String, Widget Function(BuildContext)> _routes = {'/': (context) => HomeScreen()};

  Map<String, Widget Function(BuildContext)> get routes => _routes;

  void addRoutes(Map<String, Widget Function(BuildContext)> route){
    _routes[route.keys.first] = route[route.keys.first]!;
  }

  void setNavigatorKey(GlobalKey<NavigatorState> navigatorKey) {
    _navigatorKey = navigatorKey;
  }

  void navigate(dynamic destination) {
    _navigatorKey.currentState!.push(
      MaterialPageRoute(
          builder: (context) => destination,
          fullscreenDialog: false,
          maintainState: false),
    );
  }

  void pushNamed(String routeName) {
    _navigatorKey.currentState!.pushNamed(routeName);
    //_navigatorKey.currentState!.pushNamed(pushNamed);
  }

  popNavigate() {
    if (_navigatorKey.currentState!.canPop()) {
      _navigatorKey.currentState!.pop();
    }
  }

  popToRoot() {
    if (_navigatorKey.currentState!.canPop()) {
      _navigatorKey.currentState!
          .popUntil((Route<dynamic> route) => route.isFirst);
    }
  }

  showBottomSheet(
    dynamic child, {
    Function? closed,
    Color? backgroundColor,
    bool isDismissible = true,
    bool enableDrag = true,
  }) {
    var modal = showModalBottomSheet(
      context: currentContext,
      backgroundColor: backgroundColor,
      isDismissible: isDismissible,
      enableDrag: enableDrag,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return child;
      },
    );
    modal.then((value) {
      print("bottomSheetController: $value");
      if (closed != null) {
        closed();
      }
    });
  }
}
