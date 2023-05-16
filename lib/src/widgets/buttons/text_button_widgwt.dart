import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';

class TextButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final double? fontSize;

  final Color backgroundColor;
  final Color textColor;

  final String text;

  final Function() onPressed;

  const TextButtonWidget({
    super.key,
    this.fontSize,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.textColor,
    required this.text, required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: AppShapes.radius(RadiusSize.small)),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontSize: fontSize ?? 16, decoration: TextDecoration.none),
        ),
      ),
    );
  }
}
