import 'package:flutter/src/widgets/framework.dart';
import 'package:remedio_da_hora/src/interfaces/routes_module_interface.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';

class HomeRoutes implements IRoutesModule {

  final Map<String, Widget Function(BuildContext)> _routes = {
    //'/notificacao': (context) => const NotificacaoScreen(),
  };

  @override
  void registerRoutes() {
    singRoutes.registerAllRoutes(_routes);
  }
  
}
