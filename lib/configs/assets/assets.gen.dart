/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import,implicit_dynamic_list_literal,deprecated_member_use

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $AssetsFontsGen {
  const $AssetsFontsGen();

  /// File path: assets/fonts/Raleway-Regular.ttf
  String get ralewayRegular =>
      'packages/github_test/assets/fonts/Raleway-Regular.ttf';

  /// File path: assets/fonts/Raleway-SemiBold.ttf
  String get ralewaySemiBold =>
      'packages/github_test/assets/fonts/Raleway-SemiBold.ttf';

  /// List of all assets
  List<String> get values => [ralewayRegular, ralewaySemiBold];
}

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/back_button_icon.svg
  SvgGenImage get backButtonIcon =>
      const SvgGenImage('assets/icons/back_button_icon.svg');

  /// File path: assets/icons/clear_icon.svg
  SvgGenImage get clearIcon => const SvgGenImage('assets/icons/clear_icon.svg');

  /// File path: assets/icons/favorite_active_icon.svg
  SvgGenImage get favoriteActiveIcon =>
      const SvgGenImage('assets/icons/favorite_active_icon.svg');

  /// File path: assets/icons/favorite_button_icon.svg
  SvgGenImage get favoriteButtonIcon =>
      const SvgGenImage('assets/icons/favorite_button_icon.svg');

  /// File path: assets/icons/favorite_inactive_icon.svg
  SvgGenImage get favoriteInactiveIcon =>
      const SvgGenImage('assets/icons/favorite_inactive_icon.svg');

  /// File path: assets/icons/search_icon.svg
  SvgGenImage get searchIcon =>
      const SvgGenImage('assets/icons/search_icon.svg');

  /// List of all assets
  List<SvgGenImage> get values => [
        backButtonIcon,
        clearIcon,
        favoriteActiveIcon,
        favoriteButtonIcon,
        favoriteInactiveIcon,
        searchIcon
      ];
}

class AppAssets {
  AppAssets._();

  // static const String package = 'github_test';

  static const $AssetsFontsGen fonts = $AssetsFontsGen();
  static const $AssetsIconsGen icons = $AssetsIconsGen();
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  // static const String package = 'github_test';

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    // @Deprecated('Do not specify package for a generated library asset') String? package = package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    SvgTheme theme = const SvgTheme(),
    ColorFilter? colorFilter,
    Clip clipBehavior = Clip.hardEdge,
    @deprecated Color? color,
    @deprecated BlendMode colorBlendMode = BlendMode.srcIn,
    @deprecated bool cacheColorFilter = false,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      // package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      theme: theme,
      colorFilter: colorFilter,
      color: color,
      colorBlendMode: colorBlendMode,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
    );
  }

  String get path => _assetName;

  String get keyName => 'packages/github_test/$_assetName';
}
