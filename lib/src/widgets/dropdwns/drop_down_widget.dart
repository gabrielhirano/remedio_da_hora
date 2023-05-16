import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';

class DropdownButtonWidget extends StatefulWidget {
  DropdownButtonWidget({
    super.key,
    required this.optionSelected,
    required this.onChanged,
    required this.itens, this.focus,
  });

  late String optionSelected;

  final List<DropdownMenuItem<String>> itens;

  final FocusNode? focus;

  final Function(String?) onChanged;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget> with ColorsUtils {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: DropdownButton(
        focusNode: widget.focus,
        style: TextStyle(
            color: primaryBlueDark, fontSize: 12, fontWeight: FontWeight.bold),
        autofocus: true,
        focusColor: Colors.white,
        // isDense: true,
        // dropdownColor: secondaryBlueDark,
        underline: Container(),
        iconEnabledColor: primaryBlueDark,
        value: widget.optionSelected, // Valor selecionado
        items: widget.itens,
        onChanged: (value) {
          setState(() {
            widget.optionSelected = value.toString();
          });

          widget.onChanged.call(value.toString());
        },
      ),
    );
  }
}
