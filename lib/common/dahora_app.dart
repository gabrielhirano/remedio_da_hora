import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:remedio_da_hora/src/data/data_source.dart/local_repository.dart';
import 'package:remedio_da_hora/src/data/data_source.dart/remote_repository.dart';
import 'package:remedio_da_hora/src/interfaces/base_repository_interface.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/screens/bottom_navigate.dart';
import 'package:remedio_da_hora/src/screens/tratamento/tratamento_controller.dart';
import 'package:remedio_da_hora/src/shared/library/navigator_controller.dart';
import 'package:remedio_da_hora/src/shared/library/router_controller.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';
import 'package:provider/provider.dart';

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
    return MultiProvider(
      providers: [
        Provider<BaseRepository>(
          create: (_) => RemoteRepository(),
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
