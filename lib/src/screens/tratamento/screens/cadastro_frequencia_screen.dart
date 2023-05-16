import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/widgets/buttons/text_button_widgwt.dart';

class CadastroFrequenciaTratamentoScreen extends StatefulWidget {
  const CadastroFrequenciaTratamentoScreen(
      {super.key, required this.onPressed});
  final Function() onPressed;

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
      padding: const EdgeInsets.symmetric(horizontal: 30),
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
    return Container(
      height: 260,
      child: ListView.builder(
        itemCount: options.length,
        itemBuilder: ((context, index) {
          return _card(options[index]);
        }),
      ),
    );
  }

  Widget _card(String index) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(left: 15, right: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: secondaryBlueDark,
          borderRadius: AppShapes.radius(RadiusSize.small)),
      child: GestureDetector(
        onTap: () {
          setState(() {
            valueDefault = index;
            
          });
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              index,
              style: TextStyle(
                  color: primaryBlueDark,
                  fontSize: 14,
                  fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: Container(color: secondaryBlueDark,),
            ),
            Radio<String>(
              activeColor: primaryBlueDark,
              value: index,
              groupValue: valueDefault,
              onChanged: (value) {
                setState(() {
                  valueDefault = value!;
                  print(valueDefault);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildButtonProsseguir() {
    return TextButtonWidget(
      onPressed: widget.onPressed.call,
      text: 'Prosseguir',
      textColor: Colors.white,
      backgroundColor: buttonColor,
      height: 45,
      width: double.infinity,
    );
  }
}
