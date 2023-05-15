import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final double? height;
  final Widget? title;
  final Widget? btnAction;
  final Widget child;
  final Color backgroundColor;

  const BottomSheetWidget({
    super.key,
    this.height,
    this.title,
    this.btnAction,
    this.child = const SizedBox.shrink(),
    this.backgroundColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      child: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onPanDown: (_) {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
            child: Padding(
          padding:
              EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[_buildHeaderModal(context), child],
          ),
        )),
      ),
    );
  }

  Widget _buildHeaderModal(BuildContext context) {
    if (title == null && btnAction == null) {
      return const SizedBox.shrink();
    }

    return Padding(
      padding: EdgeInsets.only(left: 24, right: 24, top: 24, bottom: 8),
      child: Row(
        children: <Widget>[
          title != null
              ? Expanded(
                  child: title ?? const SizedBox.shrink(),
                )
              : const SizedBox.shrink(),
          btnAction ?? const SizedBox.shrink()
        ],
      ),
    );
  }
}
