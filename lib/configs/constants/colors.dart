import 'package:flutter/painting.dart';

class GitHubColors {
  GitHubColors._();

  static const white = Color(0xFFFFFFFF);
  static const backgroundMain = Color(0xFFF9F9F9);

  static const layerLater_1 = Color(0xFFF2F2F2);

  static const accentPrimary = Color(0xFF1463F5);
  static const accentSecondary = Color(0xFFE5EDFF);

  static const textPrimary = Color(0xFF211814);
  static const textPlaceholder = Color(0xFFBFBFBF);
}

extension ColorsExtension on Color {
  Color darken([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslDark = hsl.withLightness((hsl.lightness - amount).clamp(0.0, 1.0));

    return hslDark.toColor();
  }

  Color lighten([double amount = .1]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withLightness((hsl.lightness + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }

  Color saturation([double amount = 1.0]) {
    assert(amount >= 0 && amount <= 1);

    final hsl = HSLColor.fromColor(this);
    final hslLight =
        hsl.withSaturation((hsl.saturation + amount).clamp(0.0, 1.0));

    return hslLight.toColor();
  }
}
