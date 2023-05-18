import 'package:flutter/material.dart';
import 'package:remedio_da_hora/common/consts.dart';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';
import 'package:remedio_da_hora/src/screens/bottom_navigate.dart';
import 'package:remedio_da_hora/src/screens/tratamento/tratamento_controller.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';
import 'package:provider/provider.dart';

class DahoraApp extends StatefulWidget {
  const DahoraApp({super.key});

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
    return MultiProvider(
      providers: [
        Provider<BaseRepository>(
          create: (_) => CONSTANT.REPOSITORY,
        ),
        ChangeNotifierProvider(
          create: (context) =>
              TratamentoController(context.read<BaseRepository>()),
        )
      ],
      child: MaterialApp(
        locale: const Locale("pt", "BR"),
        navigatorKey: _navigatorKey,
        home: const BottomNavigate(),
        // initialRoute: singRoutes.initialRoute,
        // routes: singRoutes.routes,
      ),
    );
  }
}
