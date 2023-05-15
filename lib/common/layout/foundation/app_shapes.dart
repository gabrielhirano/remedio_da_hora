import 'package:flutter/material.dart';
enum RadiusSize { extraSmall, small, medium, large, pill, circle }

mixin AppShapes {
  //! Border Radius
  static BorderRadius radius(RadiusSize? radiusSize) {
    const radiusExtraSmall = 4.0;
    double radius;
    switch (radiusSize) {
      case RadiusSize.extraSmall:
        radius = radiusExtraSmall;
        break;
      case RadiusSize.small:
        radius = radiusExtraSmall * 2;
        break;
      case RadiusSize.medium:
        radius = radiusExtraSmall * 3;
        break;
      case RadiusSize.large:
        radius = radiusExtraSmall * 4;
        break;
      case RadiusSize.pill:
        radius = radiusExtraSmall * 12;
        break;
      case RadiusSize.circle:
        radius = 1024;
        break;
      default:
        radius = 0;
        break;
    }
    return BorderRadius.all(Radius.circular(radius));
  }
}