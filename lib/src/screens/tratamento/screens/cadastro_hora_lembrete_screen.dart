import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/screens/tratamento/widgets/card_selector_widget.dart';
import 'package:remedio_da_hora/src/shared/extensions/string_extension.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';
import 'package:remedio_da_hora/src/widgets/buttons/icon_button_widget.dart';
import 'package:remedio_da_hora/src/widgets/buttons/text_button_widgwt.dart';
import 'package:remedio_da_hora/src/widgets/dropdwns/drop_down_widget.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:remedio_da_hora/src/widgets/timer_picker_widget.dart';

class CadastroHoraLembreteTratamentoScreen extends StatefulWidget {
  const CadastroHoraLembreteTratamentoScreen({super.key, required this.onNext});
  final Function() onNext;

  @override
  State<CadastroHoraLembreteTratamentoScreen> createState() =>
      _CadastroHoraLembreteTratamentoScreenState();
}

class _CadastroHoraLembreteTratamentoScreenState
    extends State<CadastroHoraLembreteTratamentoScreen> with ColorsUtils {
  String _horaController = '08:00';

  List<DropdownMenuItem<String>> optionsDose = [
    DropdownMenuItem(
      value: 'teste 1',
      child: Text('teste 1'.captalize()),
    ),
    DropdownMenuItem(
      value: 'teste 2',
      child: Text('teste 2'.captalize()),
    ),
    DropdownMenuItem(
      value: 'teste 3',
      child: Text('teste 3'.captalize()),
    ),
  ];

  String optionsDoseSelected = 'teste 1';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          iconTheme: IconThemeData(color: primaryBlueDark),
          backgroundColor: Colors.white,
          shadowColor: Colors.transparent),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return Padding(
        padding: const EdgeInsets.fromLTRB(30, 0, 30, 20),
        child: Container(
          // color: Colors.red,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                alignment: Alignment.center,
                width: double.infinity,
                child: Assets.images.imgTimerWithMedicines.png(height: 200),
              ),
              _buildNameMedicine(),
              _buildTitle(),
              const SizedBox(height: 5),
              const Spacer(),
              _buildOptionsFrequency(),
              _buildButtonProsseguir()
            ],
          ),
        ));
  }

  Widget _buildNameMedicine() {
    return Text(
      'Paracetamol 500mg Pó  para Solução Oral',
      style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: primaryBlueDarkLight),
    );
  }

  Widget _buildTitle() {
    return Text(
      'Qual sera o horário do lembrete?',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: primaryBlueDark),
    );
  }

  Widget _buildOptionsFrequency() {
    return SizedBox(
      height: 250,
      child: ListView(
        children: [
          _cardTimer(),
          _card()
          // _card(
          //   name: 'Hora',
          // ),
        ],
      ),
    );
  }

  Widget _cardTimer() {
    return CardSelectorWidget(
        onPressed: _openTimerController,
        firstColumn: Text(
          'Hora',
          style: TextStyle(
              color: primaryBlueDark,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        lastColumn: IconButtonWidget(
          text: _horaController,
          textColor: primaryBlueDark,
          textSize: 12,
          textWeight: FontWeight.bold,
          icon: const Icon(Icons.arrow_drop_down_sharp),
          iconRight: true,
          onPressed: _openTimerController,
        ));
  }

  _openTimerController() {
    singModal.openDialog(
        content: TimerPickerWidget(
      onConfirm: (hours) {},
    ));
  }

  Widget _card() {
    return CardSelectorWidget(
      onPressed: () {},
      firstColumn: Text(
        'Dose',
        style: TextStyle(
            color: primaryBlueDark, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      lastColumn: DropdownButtonWidget(
        backgroundColor: secondaryBlueDark,
        optionSelected: optionsDoseSelected,
        itens: optionsDose,
        onChanged: (value){

        },
      ),
    );
  }

  Widget _buildButtonProsseguir() {
    return TextButtonWidget(
      onPressed: () {
        widget.onNext.call();
      },
      text: 'Prosseguir',
      textColor: Colors.white,
      backgroundColor: buttonColor,
      height: 45,
      width: double.infinity,
    );
  }
}
