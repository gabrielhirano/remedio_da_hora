import 'package:flutter/material.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/screens/configuracao/configuracao_screen.dart';
import 'package:remedio_da_hora/src/screens/hoje/hoje_screen.dart';
import 'package:remedio_da_hora/src/screens/progresso/progresso_screen.dart';
import 'package:remedio_da_hora/src/screens/tratamento/tratamento_screen.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';

class BottomNavigate extends StatefulWidget {
  const BottomNavigate({Key? key}) : super(key: key);

  @override
  State<BottomNavigate> createState() => _BottomNavigateState();
}

class _BottomNavigateState extends State<BottomNavigate>  with ColorsUtils{
  int _selectedIndex = 0;

  final _screens = [
    const HojeScreen(),
    const ProgressoScreen(),
    const TratamentoScreen(),
    const ConfiguracaoScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: _screens
            .asMap()
            .map((i, screen) => MapEntry(
                  i,
                  Offstage(offstage: _selectedIndex != i, child: screen),
                ))
            .values
            .toList(),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: secondaryBlue,
        fixedColor: primaryBlueDark,
        unselectedLabelStyle: TextStyle(
            color: primaryBlue, fontWeight: FontWeight.w500),
        selectedLabelStyle: TextStyle(
            color: primaryBlue, fontWeight: FontWeight.w500),
        unselectedItemColor: primaryBlueDark,
        currentIndex: _selectedIndex,
        onTap: (i) => setState(() => _selectedIndex = i),
        selectedFontSize: 12.0,
        unselectedFontSize: 10.0,
        items: [
          BottomNavigationBarItem(
              icon: Assets.svgs.icSimpleCalendar.svg(
                width: 20,
                height: 20,
                color: primaryBlueDark,
              ),
              activeIcon: Assets.svgs.icSimpleCalendar.svg(
                width: 20,
                height: 20,
                color: primaryBlueDark,
              ),
              label: "Hoje"),
          BottomNavigationBarItem(
              icon: Assets.svgs.icProgress.svg(
                width: 20,
                height: 20,
                color: primaryBlueDark,
              ),
              activeIcon: Assets.svgs.icProgress.svg(
                width: 20,
                height: 20,
                color: primaryBlueDark,
              ),
              label: "Progresso"),
          BottomNavigationBarItem(
              icon: Assets.svgs.icTreatament.svg(
                width: 20,
                height: 20,
                color: primaryBlueDark,
              ),
              activeIcon: Assets.svgs.icTreatament.svg(
                width: 20,
                height: 20,
                color: primaryBlueDark,
              ),
              label: "Tratamento"),
          BottomNavigationBarItem(
              icon: Assets.svgs.icEngine.svg(
                width: 20,
                height: 20,
                color: primaryBlueDark,
              ),
              activeIcon: Assets.svgs.icEngine.svg(
                width: 20,
                height: 20,
                color: primaryBlueDark,
              ),
              label: "Configuração"),
        ],
      ),
    );
  }
}
