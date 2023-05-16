import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:remedio_da_hora/common/layout/foundation/app_shapes.dart';
import 'package:remedio_da_hora/src/utils/colors_utils.dart';

class CardSelectorWidget extends StatefulWidget {
  const CardSelectorWidget({
    super.key,
    required this.firstColumn,
    required this.lastColumn,
    this.onPressed,
    this.backgroundColor,
  });

  final Widget firstColumn;
  final Widget lastColumn;

  final Function()? onPressed;
  final Color? backgroundColor;

  @override
  State<CardSelectorWidget> createState() => _CardSelectorWidgetState();
}

class _CardSelectorWidgetState extends State<CardSelectorWidget>
    with ColorsUtils {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      padding: const EdgeInsets.only(left: 15, right: 10),
      width: double.infinity,
      height: 50,
      decoration: BoxDecoration(
          color: widget.backgroundColor ?? secondaryBlueDark,
          borderRadius: AppShapes.radius(RadiusSize.small)),
      child: GestureDetector(
        onTap: widget.onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.firstColumn,
            _spacerClicavel(),
            widget.lastColumn,
          ],
        ),
      ),
    );
  }

  Widget _spacerClicavel() {
    // tive que colocar uma container colorido para reconhecer o click na row
    return Expanded(
      child: Container(
        color: widget.backgroundColor ?? secondaryBlueDark,
      ),
    );
  }
}
