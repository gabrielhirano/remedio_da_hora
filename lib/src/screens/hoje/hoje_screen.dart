import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:logger/logger.dart';
import 'package:remedio_da_hora/src/screens/hoje/hoje_routes.dart';
import 'package:remedio_da_hora/src/shared/library/navigator_controller.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';

class Teste {
  Teste({
    this.contador = 0,
    required this.name,
  });

  late int contador;
  final String name;
}

var t = Teste(
  name: 'Teste contador'
);

class HojeScreen extends StatefulWidget{
  const HojeScreen({super.key});

  @override
  State<HojeScreen> createState() => _HojeScreenState();
}

class _HojeScreenState extends State<HojeScreen>  with ColorsUtils{
  HomeRoutes routesController = HomeRoutes();
  bool controller = false;
  var teste = Teste(name: 'Teste de inspec');

  @override
  void initState() {
    routesController.registerRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: primaryBlue),
      body: Column(
        children: [
          Container(
            child: Center(
              child: TextButton(
                  onPressed: () {
                    // hiranoNavigator.navigate(NotificacaoScreen());
                    //singNavigator.pushNamed('/notificacao');

                    // try {
                    //   var x = int.parse('source');
                    // } catch (error, stackTrace) {
                    //   DebugUtils.log('Teste aparecer no log',
                    //       name: 'Home page log',
                    //       error: 'Teste aparecer no log 2',
                    //       stackTrace: stackTrace);
                    // }
                    // teste.contador++;
                    // DebugUtils.inspec(teste);

                    // DebugUtils.genericLog('Teste aparecer no log', Level.debug);
                    // DebugUtils.genericLog('Teste aparecer no log', Level.error);
                    // DebugUtils.genericLog('Teste aparecer no log', Level.info);
                    // DebugUtils.genericLog(
                    //     'Teste aparecer no log', Level.verbose);
                    // DebugUtils.genericLog(
                    //     'Teste aparecer no log', Level.warning);
                    // DebugUtils.genericLog('Teste aparecer no log', Level.wtf);
                    // setState(() {
                    //   controller = !controller;
                    // });[[
                  },
                  child: Text('Click')),
            ),
          ),
          SizedBox(height: 40, width: 40),
          Container(
            width: double.infinity,
            height: 200,
            color: controller ? Colors.red : Colors.blue,
          ),
          Text(t.contador.toString()),
          TextButton(
              onPressed: () {
                t.contador++;
              },
              child: const Text('Increment'))
        ],
      ),
    );
  }
}
