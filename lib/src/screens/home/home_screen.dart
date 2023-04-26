import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:remedio_da_hora/src/screens/home/home_routes.dart';
import 'package:remedio_da_hora/src/screens/home/notificacao/notificacao_screen.dart';
import 'package:remedio_da_hora/src/shared/library/navigator_controller.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeRoutes routesController = HomeRoutes();
  bool controller = false;

  @override
  void initState() {
    routesController.registerRoutes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: ColorsUtils.primaryBlue),
      body: Column(
        children: [
          Container(
            child: Center(
              child: TextButton(
                  onPressed: () {
                    // hiranoNavigator.navigate(NotificacaoScreen());
                    singNavigator.pushNamed('/notificacao');
                    // setState(() {
                    //   controller = !controller;
                    // });
                  },
                  child: Text('Click')),
            ),
          ),
          SizedBox(height: 40, width: 40),
          Container(
            width: double.infinity,
            height: 200,
            color: controller ? Colors.red : Colors.blue,
          )
        ],
      ),
    );
  }
}
