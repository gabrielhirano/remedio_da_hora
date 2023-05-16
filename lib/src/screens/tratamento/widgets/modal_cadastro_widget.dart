import 'package:flutter/material.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/shared/extensions/string_extension.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/widgets/buttons/text_button_widgwt.dart';
import 'package:remedio_da_hora/src/widgets/dropdwns/drop_down_widget.dart';

class ModalCadastroWidget extends StatefulWidget {
  const ModalCadastroWidget(
      {super.key, required this.medicine, required this.onNext});
  final Medicine medicine;
  final Function() onNext;

  @override
  State<ModalCadastroWidget> createState() => _ModalCadastroWidgetState();
}

class _ModalCadastroWidgetState extends State<ModalCadastroWidget>
    with ColorsUtils {
  TextEditingController textController = TextEditingController();

  String optionUnitySelected = 'comprimido';

  List<DropdownMenuItem<String>> itens = [
    DropdownMenuItem(
      value: 'comprimido',
      child: Text('comprimido'.captalize()),
    ),
    DropdownMenuItem(
      value: 'mililitro',
      child: Text('mililitro'.captalize()),
    ),
    DropdownMenuItem(
      value: 'miligrama',
      child: Text('miligrama'.captalize()),
    ),
    DropdownMenuItem(
      value: 'grama',
      child: Text('grama'.captalize()),
    ),
    DropdownMenuItem(
      value: 'spray',
      child: Text('spray'.captalize()),
    ),
    DropdownMenuItem(
      value: 'gota',
      child: Text('gota'.captalize()),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return _modalCadastroNomeMedicamento();
  }

  Widget _modalCadastroNomeMedicamento() {
    return Container(
      height: 280,
      decoration: BoxDecoration(
          color: primaryBlue, borderRadius: AppShapes.radius(RadiusSize.small)),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
      child: Column(
        children: [
          Text(
            'Medicamentos',
            style: TextStyle(
                color: primaryBlueDark,
                fontSize: 16,
                decoration: TextDecoration.none),
          ),
          const SizedBox(height: 5),
          _buildNomeMedicamentoReativo(),
          const SizedBox(height: 10),
          SizedBox(
            height: 50,
            child: Material(
              borderRadius: AppShapes.radius(RadiusSize.small),
              child: TextField(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: primaryBlueDark)),
                  labelText: 'Nome do medicamento',
                  labelStyle: TextStyle(color: primaryBlueDark),
                  hintText: 'Ex: Paracetamol...',
                  hintStyle: TextStyle(color: primaryBlueDark),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15), // Define o espaçamento à esquerda
                    child: Assets.svgs.icPill.svg(
                      color: primaryBlueDark,
                    ),
                  ),
                  prefixIconConstraints:
                      const BoxConstraints(maxHeight: 46, maxWidth: 46),
                  border: OutlineInputBorder(
                    borderRadius: AppShapes.radius(RadiusSize.small),
                  ),
                ),
                controller: textController,
                keyboardType: TextInputType.text,
                onChanged: (value) {
                  setState(() {});
                },
              ),
            ),
          ),
          const SizedBox(height: 15),
          _cardUnidadeController(),
          const SizedBox(height: 15),
          _buildButtonProsseguir()
        ],
      ),
    );
  }

  Widget _buildNomeMedicamentoReativo() {
    if (textController.text.isEmpty) return const SizedBox.shrink();
    return Container(
      height: 20,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        textController.text.toString(),
        style: TextStyle(
            color: primaryBlueDark,
            fontSize: 12,
            decoration: TextDecoration.none,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Widget _cardUnidadeController() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          border: Border.all(color: secondaryBlueDark, width: 1),
          borderRadius: AppShapes.radius(RadiusSize.small),
          color: Colors.white),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'Unidade',
            style: TextStyle(
                fontSize: 14,
                color: primaryBlueDark,
                decoration: TextDecoration.none),
          ),
          const Spacer(),
          SizedBox(
            height: 40,
            child: DropdownButtonWidget<String>(
              optionSelected: optionUnitySelected,
              itens: itens,
              onChanged: (value) {
                optionUnitySelected = value;
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButtonProsseguir() {
    return TextButtonWidget(
      onPressed: (){
        widget.medicine.name = textController.text;
        widget.medicine.unity = optionUnitySelected;
        
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
