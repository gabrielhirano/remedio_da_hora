import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  Assets._();
  static const svgs = SvgAssetsGenerate();
}

class SvgAssetsGenerate {
  const SvgAssetsGenerate();

  SvgGenImage get icPill => const SvgGenImage('assets/svgs/ic_pill.svg');
  SvgGenImage get icBell => const SvgGenImage('assets/svgs/ic_bell.svg');

  SvgGenImage get icSimpleCalendar => const SvgGenImage('assets/svgs/ic_simple_calendar.svg');
  SvgGenImage get icProgress => const SvgGenImage('assets/svgs/ic_progress.svg');
  SvgGenImage get icTreatament => const SvgGenImage('assets/svgs/ic_treatament.svg');
  SvgGenImage get icEngine => const SvgGenImage('assets/svgs/ic_engine.svg');


  List<SvgGenImage> get values => [
    icPill,
    icBell,
    icSimpleCalendar,
    icProgress,
    icTreatament,
    icEngine
  ];
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    double? width,
    double? height,
    Color? color
    // Key? key,
    // bool matchTextDirection = false,
    // AssetBundle? bundle,
    // String? package,
    // double? width,
    // double? height,
    // BoxFit fit = BoxFit.contain,
    // AlignmentGeometry alignment = Alignment.center,
    // bool allowDrawingOutsideViewBox = false,
    // WidgetBuilder? placeholderBuilder,
    // Color? color,
    // BlendMode colorBlendMode = BlendMode.srcIn,
    // String? semanticsLabel,
    // bool excludeFromSemantics = false,
    // Clip clipBehavior = Clip.hardEdge,
    // bool cacheColorFilter = false,
    // SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      width: width,
      height: height,
      color: color,
      // key: key,
      // matchTextDirection: matchTextDirection,
      // bundle: bundle,
      // package: package,
      // width: width,
      // height: height,
      // fit: fit,
      // alignment: alignment,
      // allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      // placeholderBuilder: placeholderBuilder,
      // color: color,
      // colorBlendMode: colorBlendMode,
      // semanticsLabel: semanticsLabel,
      // excludeFromSemantics: excludeFromSemantics,
      // clipBehavior: clipBehavior,
      // cacheColorFilter: cacheColorFilter,
      // theme: theme,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
