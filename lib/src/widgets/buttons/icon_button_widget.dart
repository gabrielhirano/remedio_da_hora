import 'package:flutter/material.dart';

enum BorderRadiusOwn { circular, softCircular, none }

extension borderRadiusValues on BorderRadiusOwn {
  double size() {
    return <BorderRadiusOwn, double>{
      BorderRadiusOwn.circular: 50,
      BorderRadiusOwn.softCircular: 10,
      BorderRadiusOwn.none: 0,
    }[this]!;
  }
}

class IconButtonWidget extends StatelessWidget {
  IconButtonWidget({
    super.key,
    this.width,
    this.height,
    this.borderRadius = BorderRadiusOwn.none,
    this.color,
    required this.icon,
    required this.text,
    required this.onPressed,
    this.textColor,
    this.textSize,
    this.iconRight = false,
    this.textWeight,
  });

  final Function() onPressed;
  final double? width;
  final double? height;
  final BorderRadiusOwn? borderRadius;
  final Color? color;

  final Widget icon;
  bool iconRight;

  final String text;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textWeight;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius!.size())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: _buildItensOrdened(),
        ),
      ),
    );
  }

  List<Widget> _buildItensOrdened() {
    List<Widget> itens = [];
    if (iconRight == false) {
      itens.add(icon);
    }
    itens.add(const SizedBox(width: 5));
    itens.add(Text(
      text,
      style: TextStyle(
          color: textColor ?? Colors.white,
          fontSize: textSize ?? 15,
          fontWeight: textWeight ?? FontWeight.w600),
    ));

    if (iconRight == true) {
      itens.add(icon);
    }
    return itens;
  }
}
