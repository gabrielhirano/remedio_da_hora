import 'package:flutter/material.dart';
mixin ColorsUtils {
  Color get primaryBlue => getColorByHex('#C3DCEC');
  Color get primaryBlueLight => getColorByHex('#AAD5F0');

  Color get secondaryBlue => getColorByHex('#99CEEF');

  Color get primaryBlueDark => getColorByHex('#063A58');
  Color get primaryBlueDarkLight => getColorByHex('#406377');

  Color get secondaryBlueDark => getColorByHex('#A6BECE');

  Color getColorByHex(String hex) {
    return Color(int.parse("0xFF${hex.replaceAll('#', '')}"));
  }
}
