import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  Assets._();
  static const svgs = SvgAssetsGenerate();
  static const images = ImageAssetsGenerate();
}

class GenImagePng {
  const GenImagePng(this._assetName);

  final String _assetName;

  Image png({double? width, double? height}) {
    return Image.asset(
      _assetName,
      width: width,
      height: height,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class ImageAssetsGenerate {
  const ImageAssetsGenerate();

  GenImagePng get imgMedicines => const GenImagePng('assets/images/img_medicine.png');
  GenImagePng get imgTimerWithMedicines =>
      const GenImagePng('assets/images/img_timer_with_medicines.png');
}

class SvgAssetsGenerate {
  const SvgAssetsGenerate();

  GenImageSvg get icPill => const GenImageSvg('assets/svgs/ic_pill.svg');
  GenImageSvg get icBell => const GenImageSvg('assets/svgs/ic_bell.svg');

  GenImageSvg get icSimpleCalendar => const GenImageSvg('assets/svgs/ic_simple_calendar.svg');

  GenImageSvg get icProgress => const GenImageSvg('assets/svgs/ic_progress.svg');

  GenImageSvg get icTreatament => const GenImageSvg('assets/svgs/ic_treatament.svg');

  GenImageSvg get icEngine => const GenImageSvg('assets/svgs/ic_engine.svg');

  GenImageSvg get icTrash => const GenImageSvg('assets/svgs/ic_trash.svg');

  List<GenImageSvg> get values => [
        icPill,
        icBell,
        icSimpleCalendar,
        icProgress,
        icTreatament,
        icEngine,
      ];
}

class GenImageSvg {
  const GenImageSvg(this._assetName);

  final String _assetName;

  SvgPicture svg({double? width, double? height, Color? color}) {
    return SvgPicture.asset(
      _assetName,
      width: width,
      height: height,
      color: color,
    );
  }

  Image png({double? width, double? height}) {
    return Image.asset(
      _assetName,
      width: width,
      height: height,
    );
  }

  String get path => _assetName;

  String get keyName => _assetName;
}
