import 'package:flutter/material.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';

class BottomSheetListOptionWidget extends StatelessWidget  with ColorsUtils{
  const BottomSheetListOptionWidget({super.key, required this.onPressed, required this.icon, required this.text, this.textColor});

  final Function() onPressed;
  final dynamic icon;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        color: primaryBlueLight,
        width: double.infinity,
        height: 40,
        child: Row(
          children: [
            icon,
            const SizedBox(width: 20),
            Text(
              text,
              style: TextStyle(
                fontSize: 14,
                color: textColor ?? primaryBlueDark,
                fontWeight: FontWeight.w700,
              ),
            )
          ],
        ),
      ),
    );
  }
}
