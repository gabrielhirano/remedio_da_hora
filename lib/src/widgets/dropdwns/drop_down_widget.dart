import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';

class DropdownButtonWidget extends StatefulWidget {
  DropdownButtonWidget({
    super.key,
    required this.optionSelected,
    required this.onChanged,
    required this.itens,
    this.focus,
    this.backgroundColor,
  });

  late String optionSelected;

  final List<DropdownMenuItem<String>> itens;

  final FocusNode? focus;

  final Function(String?) onChanged;
  final Color? backgroundColor;

  @override
  State<DropdownButtonWidget> createState() => _DropdownButtonWidgetState();
}

class _DropdownButtonWidgetState extends State<DropdownButtonWidget>
    with ColorsUtils {
  @override
  void initState() {
    // TODO: implement initState
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // final controller =
      //     Provider.of<TratamentoController>(context, listen: false);
      // controller.buscarMedicamentos();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: widget.backgroundColor,
      child: DropdownButton(
        // focusNode: widget.focus,
        style: TextStyle(
            color: primaryBlueDark, fontSize: 12, fontWeight: FontWeight.bold),
        autofocus: true,
        focusColor: widget.backgroundColor ?? Colors.white,
        // isDense: true,
        //dropdownColor: widget.backgroundColor ?? Colors.white,
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
