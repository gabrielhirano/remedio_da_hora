import 'package:flutter/material.dart';
import 'package:remedio_da_hora/app/config/config_app.dart';
import 'package:remedio_da_hora/common/dahora_app.dart';


void main() {
  
  ConfigApp.setup();
  
  runApp(const DahoraApp());
}