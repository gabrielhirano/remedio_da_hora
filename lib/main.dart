import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:remedio_da_hora/app/config/config_app.dart';
import 'package:remedio_da_hora/app/dahora_app.dart';

import 'src/shared/library/navigator_controller.dart';
import 'src/shared/library/router_controller.dart';

void main() {
  
  ConfigApp.setup();
  runApp(DahoraApp());
}