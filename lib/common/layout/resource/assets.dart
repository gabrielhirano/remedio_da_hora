import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Assets {
  Assets._();
  static const svgs = SvgAssetsGenerate();
  static const images = ImageAssetsGenerate();
}

class ImageAssetsGenerate {
  const ImageAssetsGenerate();

  GenImage get imgMedicines => const GenImage('assets/images/img_medicine.png');
  GenImage get imgTimerWithMedicines => const GenImage('assets/images/img_timer_with_medicines.png');
}

class SvgAssetsGenerate {
  const SvgAssetsGenerate();

  GenImage get icPill => const GenImage('assets/svgs/ic_pill.svg');
  GenImage get icBell => const GenImage('assets/svgs/ic_bell.svg');

  GenImage get icSimpleCalendar =>
      const GenImage('assets/svgs/ic_simple_calendar.svg');
  GenImage get icProgress =>
      const GenImage('assets/svgs/ic_progress.svg');
  GenImage get icTreatament =>
      const GenImage('assets/svgs/ic_treatament.svg');
  GenImage get icEngine => const GenImage('assets/svgs/ic_engine.svg');

    GenImage get icTrash => const GenImage('assets/svgs/ic_trash.svg');

  List<GenImage> get values => [
        icPill,
        icBell,
        icSimpleCalendar,
        icProgress,
        icTreatament,
        icEngine,
      ];
}

class GenImage {
  const GenImage(this._assetName);

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
