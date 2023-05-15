import 'package:get_it/get_it.dart';
import 'package:remedio_da_hora/src/shared/library/modal_controller.dart';
import 'package:remedio_da_hora/src/shared/library/navigator_controller.dart';
import 'package:remedio_da_hora/src/shared/library/router_controller.dart';

final singNavigator = GetIt.I<NavigatorController>();
final singRoutes = GetIt.I<RouterController>(); 

final singModal = GetIt.I<ModalController>();


