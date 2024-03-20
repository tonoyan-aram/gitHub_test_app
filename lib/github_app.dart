import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_test/configs/router/navigation_service.dart';
import 'package:github_test/configs/router/pages.dart';
import 'package:github_test/utils/providers.dart';

import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class GitHubApp extends StatefulWidget {
  const GitHubApp({super.key});

  @override
  State<GitHubApp> createState() => _GitHubAppState();
}

class _GitHubAppState extends State<GitHubApp> {
  @override
  void initState() {
    super.initState();
    setIsFirst();
  }

  Future setIsFirst() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool("isFirst", true);
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: MultiProvider(
        providers: providers,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: PageRouteName.splashScreen,
          // locale: const Locale("ru"),
          navigatorKey: navigationInstance.navigatorKey,
          routes: navigationInstance.routes,
        ),
      ),
    );
  }
}
