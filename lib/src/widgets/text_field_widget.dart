import 'package:flutter/material.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';

class TextFieldWidget extends StatelessWidget with ColorsUtils{
  const TextFieldWidget({super.key, required this.textController, required this.labelText, required this.hintText, required this.prefixIcon, required this.onChanged});

  final TextEditingController textController;
  final String labelText;
  final String hintText;

  final Widget prefixIcon;

  final Function(String value) onChanged;

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: AppShapes.radius(RadiusSize.small),
      child: TextField(
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: primaryBlueDark)),
          labelText: labelText,
          labelStyle: TextStyle(color: primaryBlueDark),
          hintText: hintText,
          hintStyle: TextStyle(color: primaryBlueDark),
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 15), // Define o espaçamento à esquerda
            child: prefixIcon
          ),
          prefixIconConstraints:
              const BoxConstraints(maxHeight: 46, maxWidth: 46),
          border: OutlineInputBorder(
            borderRadius: AppShapes.radius(RadiusSize.small),
          ),
        ),
        controller: textController,
        keyboardType: TextInputType.text,
        onChanged: onChanged,
      ),
    );
  }
}
