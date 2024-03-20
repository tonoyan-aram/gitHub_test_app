import 'package:flutter/material.dart';
import 'package:github_test/configs/constants/colors.dart';
import 'package:github_test/configs/router/pages.dart';
import 'package:github_test/presentation/screens/favorite/favorite_screen.dart';
import 'package:github_test/presentation/screens/main/search_screen.dart';
import 'package:github_test/presentation/screens/splash/splash_screen.dart';

final navigationInstance = NavigationService.instance;

class NavigationService {
  NavigationService._();
  static final NavigationService instance = NavigationService._();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;
  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  NavigatorState? get _navigatorState => _navigatorKey.currentState;
  BuildContext? get buildContext => _navigatorKey.currentContext;

  Map<String, WidgetBuilder> routes = {
    PageRouteName.splashScreen: (_) => const SplashScreen(),
    PageRouteName.searchScreen: (_) => const SearchScreen(),
    PageRouteName.favoriteScreen: (_) => const FavoriteScreen(),
  };

  Future<dynamic>? navigateTo(String page, {Object? arguments}) async {
    return await _navigatorState?.pushNamed(page);
  }

  Future<dynamic>? navigateWithReplaceTo(String page,
      {Object? arguments}) async {
    return await _navigatorState?.pushReplacementNamed(page);
  }

  Future<dynamic>? navigateAndRemoveUntil(String page,
      {Object? arguments}) async {
    return await _navigatorState?.pushNamedAndRemoveUntil(
      page,
      (route) => false,
      arguments: arguments,
    );
  }

  Future<dynamic>? popAndNavigateTo(String page, {Object? arguments}) async {
    return await _navigatorState?.popAndPushNamed(page);
  }

  void pop<T extends Object?>([T? result]) {
    _navigatorState!.pop(result);
  }

  void popUntil(String page, {Object? arguments}) {
    _navigatorState!.popUntil((r) => r.settings.name == page);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    Widget resultPage;
    String? routeName = settings.name;
    switch (routeName) {
      case PageRouteName.searchScreen:
        resultPage = const SearchScreen();
        break;
      case PageRouteName.favoriteScreen:
        resultPage = const FavoriteScreen();
        break;

      default:
        resultPage = const Scaffold(
          backgroundColor: GitHubColors.accentPrimary,
        );
        break;
    }
    return _getMaterialPageRoute(resultPage, settings: settings);
  }

  Route<dynamic> _getMaterialPageRoute(
    Widget widget, {
    RouteSettings? settings,
  }) {
    return MaterialPageRoute(
      builder: (_) => widget,
      settings: settings,
    );
  }
}
