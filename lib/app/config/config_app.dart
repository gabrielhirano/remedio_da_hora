import 'package:get_it/get_it.dart';
import 'package:remedio_da_hora/src/shared/library/navigator_controller.dart';
import 'package:remedio_da_hora/src/shared/library/router_controller.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';

class ConfigApp {

  static setup(){
    GetIt getIt = GetIt.I;
    getIt.registerSingleton(NavigatorController());
    getIt.registerSingleton(RouterController());
  }
}