import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/screens/tratamento/widgets/card_selector_widget.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/widgets/buttons/text_button_widgwt.dart';

class CadastroFrequenciaTratamentoScreen extends StatefulWidget {
  const CadastroFrequenciaTratamentoScreen(
      {super.key, required this.onNext, required this.medicine});
  final Medicine medicine;
  final Function() onNext;

  @override
  State<CadastroFrequenciaTratamentoScreen> createState() =>
      _CadastroFrequenciaTratamentoScreenState();
}

class _CadastroFrequenciaTratamentoScreenState
    extends State<CadastroFrequenciaTratamentoScreen> with ColorsUtils {
  final List<String> options = [
    'Uma vez ao dia',
    'Duas vez ao dia',
    'Tres vez ao dia',
    'Quatro vez ao dia',
  ];
  late String valueDefault = options[0];

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
            child: Assets.images.imgMedicines.png(height: 200),
          ),
          const SizedBox(height: 10),
          _buildNameMedicine(),
          _buildTitle(),
          const SizedBox(height: 5),
          _buildOptionsFrequency(),
          const Spacer(),
          _buildButtonProsseguir()
        ],
      ),
    );
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
      'Qual sera a frequência desse medicamento?',
      style: TextStyle(
          fontSize: 20, fontWeight: FontWeight.bold, color: primaryBlueDark),
    );
  }

  Widget _buildOptionsFrequency() {
    return SizedBox(
      height: 250,
      child: ListView.builder(
        itemCount: options.length,
        itemBuilder: ((context, index) {
          return _card(options[index]);
        }),
      ),
    );
  }

  Widget _card(String index) {
    return CardSelectorWidget(
        onPressed: () {
          setState(() {
            valueDefault = index;
          });
        },
        firstColumn: Text(
          index,
          style: TextStyle(
              color: primaryBlueDark,
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        lastColumn: Radio<String>(
          activeColor: primaryBlueDark,
          value: index,
          groupValue: valueDefault,
          onChanged: (value) {
            setState(() {
              valueDefault = value!;
            });
          },
        ));
  }

  Widget _buildButtonProsseguir() {
    return TextButtonWidget(
      onPressed: () {
        widget.medicine.frequency = valueDefault;
        
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
