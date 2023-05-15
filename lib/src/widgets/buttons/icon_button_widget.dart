import 'package:flutter/material.dart';
/*
Icon(
  Icons.circle,
  color: Colors.white,
  size: 25,
),
     width: 120,
        height: 50,

 */

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
  const IconButtonWidget({
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
  });

  final Function() onPressed;
  final double? width;
  final double? height;
  final BorderRadiusOwn? borderRadius;
  final Color? color;

  final Widget icon;

  final String text;
  final Color? textColor;
  final double? textSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
            color: color, borderRadius: BorderRadius.circular(borderRadius!.size())),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            const SizedBox(width: 5),
            Text(
              text,
              style: TextStyle(
                  color: textColor ?? Colors.white,
                  fontSize: textSize ?? 15,
                  fontWeight: FontWeight.w600),
            )
          ],
        ),
      ),
    );
    ;
  }
}
