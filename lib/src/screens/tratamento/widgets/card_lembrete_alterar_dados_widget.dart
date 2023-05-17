import 'package:flutter/material.dart';
import 'package:remedio_da_hora/common/layout/resource/assets.dart';
import 'package:remedio_da_hora/src/models/medicine_model.dart';
import 'package:remedio_da_hora/src/screens/tratamento/tratamento_controller.dart';
import 'package:remedio_da_hora/src/screens/tratamento/widgets/card_selector_widget.dart';
import 'package:remedio_da_hora/src/shared/extensions/string_extension.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';
import 'package:remedio_da_hora/src/utils/global_utils.dart';
import 'package:remedio_da_hora/src/widgets/buttons/generic_button_widget.dart';
import 'package:remedio_da_hora/src/widgets/buttons/icon_button_widget.dart';
import 'package:remedio_da_hora/src/widgets/buttons/text_button_widgwt.dart';
import 'package:remedio_da_hora/src/widgets/dropdwns/drop_down_widget.dart';
import 'package:remedio_da_hora/src/widgets/text_field_widget.dart';
import 'package:remedio_da_hora/src/widgets/timer_picker_widget.dart';

class CardLembreteAlterarDadosWidget extends StatefulWidget {
  const CardLembreteAlterarDadosWidget(
      {super.key, required this.medicine, required this.controller});
  final Medicine medicine;
  final TratamentoController controller;

  @override
  State<CardLembreteAlterarDadosWidget> createState() =>
      _CardLembreteAlterarDadosWidgetState();
}

class _CardLembreteAlterarDadosWidgetState
    extends State<CardLembreteAlterarDadosWidget> with ColorsUtils {
  late int optionsDoseSelected;

  late String optionsUnitySelected;

  late String optionHourSelected;

  late String optionFrequencySelected;

  late List<DropdownMenuItem<int>> optionsDose;

  late List<DropdownMenuItem<String>> optionsUnity;

  late List<DropdownMenuItem<String>> optionsFrequency;
  final TextEditingController textController = TextEditingController();

  @override
  void initState() {
    super.initState();

    optionHourSelected = widget.medicine.time!;
    optionsUnitySelected = widget.medicine.unity!;
    optionsDoseSelected = widget.medicine.dose!.toInt();
    optionFrequencySelected = widget.medicine.frequency!;

    textController.text = widget.medicine.name!;
  }

  @override
  Widget build(BuildContext context) {
    return _card(widget.medicine);
  }

  Widget _card(Medicine medicine) {
    return Container(
      height: 300,
      width: double.infinity,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: primaryBlue,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildNomeMedicamentoReativo(),
          const SizedBox(height: 5),
          TextFieldWidget(
            labelText: 'Nome do medicamento',
            hintText: 'Ex: Paracetamol...',
            textController: textController,
            prefixIcon: Assets.svgs.icPill.svg(
              color: primaryBlueDark,
            ),
            onChanged: (value) {
              setState(() {});
            },
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: GenericButtonWidget(
                    color: secondaryBlueDark,
                    onPressed: () {},
                    child: _buildDropDownUnity(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GenericButtonWidget(
                    color: secondaryBlueDark,
                    onPressed: () {},
                    child: _buildDropdownDose(),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: GenericButtonWidget(
                    color: secondaryBlueDark,
                    onPressed: () {},
                    child: _buildDropDownTimer(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: GenericButtonWidget(
                    color: secondaryBlueDark,
                    onPressed: () {},
                    child: _buildDropDownFrequency(),
                  ),
                ),
              ],
            ),
          ),
          Spacer(),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: Row(
              children: [
                Expanded(
                  child: _buildButtonRemove(),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: _buildButtonConfirm(),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _buildNomeMedicamentoReativo() {
    String text;
    if (textController.text.isEmpty) {
      text = widget.medicine.name!;
    } else {
      text = textController.text;
    }

    return Container(
      height: 20,
      width: double.infinity,
      alignment: Alignment.centerLeft,
      child: Text(
        text.captalize(allWorlds: true),
        style: TextStyle(
            color: primaryBlueDark,
            fontSize: 12,
            decoration: TextDecoration.none,
            overflow: TextOverflow.ellipsis),
      ),
    );
  }

  Widget _buildDropDownTimer() {
    return IconButtonWidget(
      width: double.infinity,
      text: '$optionHourSelected          ',
      textColor: primaryBlueDark,
      textSize: 12,
      textWeight: FontWeight.bold,
      icon: Icon(
        Icons.arrow_drop_down_sharp,
        color: primaryBlueDark,
      ),
      iconRight: true,
      onPressed: () {
        singModal.openDialog(
          content: TimerPickerWidget(
            onConfirm: (hours) {
              setState(() {
                optionHourSelected = hours;
              });
            },
          ),
        );
      },
    );
  }

  Widget _buildDropDownFrequency() {
    optionsFrequency = const [
      DropdownMenuItem(
        value: '1 vez ao dia',
        child: Text('1 vez ao dia'),
      ),
      DropdownMenuItem(
        value: '2 vezes ao dia',
        child: Text('2 vezes ao dia'),
      ),
      DropdownMenuItem(
        value: '3 vezes ao dia',
        child: Text('3 vezes ao dia'),
      ),
      DropdownMenuItem(
        value: '4 vezes ao dia',
        child: Text('4 vezes ao dia'),
      ),
    ];

    return Container(
      height: 46,
      alignment: Alignment.center,
      child: DropdownButtonWidget<String>(
        backgroundColor: secondaryBlueDark,
        optionSelected: optionFrequencySelected,
        itens: optionsFrequency,
        onChanged: (value) {
          print(value);
          setState(() {
            optionFrequencySelected = value!;
          });
        },
      ),
    );
  }

  Widget _buildDropDownUnity() {
    optionsUnity = [
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

    return Container(
      height: 46,
      alignment: Alignment.center,
      child: DropdownButtonWidget<String>(
        backgroundColor: secondaryBlueDark,
        optionSelected: optionsUnitySelected,
        itens: optionsUnity,
        onChanged: (value) {
          setState(() {
            optionsUnitySelected = value;
          });
        },
      ),
    );
  }

  Widget _buildDropdownDose() {
    optionsDose = [
      DropdownMenuItem(
        value: 1,
        child: Text('1 $optionsUnitySelected'.captalize()),
      ),
      DropdownMenuItem(
        value: 2,
        child: Text('2 $optionsUnitySelected'.captalize()),
      ),
      DropdownMenuItem(
        value: 3,
        child: Text('3 $optionsUnitySelected'.captalize()),
      ),
      DropdownMenuItem(
        value: 4,
        child: Text('4 $optionsUnitySelected'.captalize()),
      ),
    ];

    return Container(
      height: 46,
      alignment: Alignment.center,
      child: DropdownButtonWidget<int>(
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

  _buildButtonRemove() {
    return GenericButtonWidget(
      color: primaryBlue,
      borderColor: primaryBlue,
      onPressed: () {},
      child: IconButtonWidget(
        icon: Container(
          margin: const EdgeInsets.only(right: 10),
          child: Assets.svgs.icTrash.svg(height: 20, color: Colors.red),
        ),
        text: 'Remover',
        textColor: Colors.red,
        textSize: 14,
        onPressed: () {
          widget.controller.removerMedicamento(widget.medicine);
          singNavigator.popNavigate();
        },
      ),
    );
  }

  _buildButtonConfirm() {
    return TextButtonWidget(
      width: double.infinity,
      height: 50,
      backgroundColor: secondaryBlueDark,
      textColor: primaryBlueDark,
      text: 'Confirmar',
      fontSize: 14,
      onPressed: () {
        widget.controller.alterarMedicamento(_factoryMedicine());
        singNavigator.popNavigate();
      },
    );
  }

  Medicine _factoryMedicine() {
    print(widget.medicine.id);
    Medicine medicine = Medicine(
        id: widget.medicine.id,
        name: textController.text,
        unity: optionsUnitySelected,
        frequency: optionFrequencySelected,
        dose: optionsDoseSelected,
        time: optionHourSelected);
    return medicine;
  }
}
