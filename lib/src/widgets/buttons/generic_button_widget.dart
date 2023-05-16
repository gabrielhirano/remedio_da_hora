import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';

class GenericButtonWidget extends StatelessWidget with ColorsUtils{
  const GenericButtonWidget({super.key, required this.onPressed, this.width, this.height, this.color, required this.child, this.borderColor});
  final Function() onPressed;
  final double? width;
  final double? height;
  final Color? color;
  final Color? borderColor;

  final Widget child;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width ?? double.infinity,
        height: height ?? 50,
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: color ?? buttonColor,
            borderRadius: AppShapes.radius(RadiusSize.small),
            border: Border.all(
              color: borderColor ?? primaryBlueDark
            )),
        child: child,
      ),
    );
  }
}
