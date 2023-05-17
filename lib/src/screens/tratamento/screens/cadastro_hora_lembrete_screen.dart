import 'package:flutter/material.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/screens/tratamento/widgets/card_selector_widget.dart';
import 'package:remedio_da_hora/src/shared/extensions/string_extension.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/utils/debug_utils.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';
import 'package:remedio_da_hora/src/widgets/buttons/icon_button_widget.dart';
import 'package:remedio_da_hora/src/widgets/buttons/text_button_widgwt.dart';
import 'package:remedio_da_hora/src/widgets/dropdwns/drop_down_widget.dart';
import 'package:remedio_da_hora/src/widgets/timer_picker_widget.dart';

class CadastroHoraLembreteTratamentoScreen extends StatefulWidget {
  const CadastroHoraLembreteTratamentoScreen(
      {super.key, required this.onNext, required this.medicine});
  final Medicine medicine;
  final Function() onNext;

  @override
  State<CadastroHoraLembreteTratamentoScreen> createState() =>
      _CadastroHoraLembreteTratamentoScreenState();
}

class _CadastroHoraLembreteTratamentoScreenState
    extends State<CadastroHoraLembreteTratamentoScreen> with ColorsUtils {

  String _horaController = '08:00';

  late List<DropdownMenuItem<int>> optionsDose;

  int optionsDoseSelected = 1;

  @override
  void initState() {
    super.initState();
    _fillHoraController();
    optionsDose = [
      DropdownMenuItem(
        value: 1,
        child: Text('1 ${widget.medicine.unity}'.captalize()),
      ),
      DropdownMenuItem(
        value: 2,
        child: Text('2 ${widget.medicine.unity}s'.captalize()),
      ),
      DropdownMenuItem(
        value: 3,
        child: Text('3 ${widget.medicine.unity}s'.captalize()),
      ),
      DropdownMenuItem(
        value: 4,
        child: Text('4 ${widget.medicine.unity}s'.captalize()),
      ),
    ];
  }

  _fillHoraController(){
    _horaController = <String, String>{
      '1 vez ao dia': '15:00',
      '2 vezes ao dia': '12:00',
      '3 vezes ao dia': '08:00',
      '4 vezes ao dia': '06:00',
    }[widget.medicine.frequency]!;
  }

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
        ));
  }

  Widget _buildNameMedicine() {
    return Text(
      widget.medicine.name!.captalize(allWorlds: true),
      style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: primaryBlueDarkLight),
    );
  }

  Widget _buildTitle() {
    String prefixText = widget.medicine.frequency == 'Uma vez ao dia' ? '' : 'primeiro';
    return Text(
      'Qual sera o horário do $prefixText lembrete?',
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
        onConfirm: (hours) {
          setState(() {
            _horaController = hours;
          });
        },
      ),
    );
  }

  Widget _card() {
    return CardSelectorWidget(
      onPressed: () {},
      firstColumn: Text(
        'Dose',
        style: TextStyle(
            color: primaryBlueDark, fontSize: 14, fontWeight: FontWeight.bold),
      ),
      lastColumn: DropdownButtonWidget<int>(
        backgroundColor: secondaryBlueDark,
        optionSelected: optionsDoseSelected,
        itens: optionsDose,
        onChanged: (value) {
          setState(() {
            optionsDoseSelected = value!;
          });
        },
      ),
    );
  }

  Widget _buildButtonProsseguir() {
    return TextButtonWidget(
      onPressed: () {
        widget.medicine.time = _horaController;
        widget.medicine.dose = optionsDoseSelected;
        
        DebugUtils.inspec(widget.medicine);
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
