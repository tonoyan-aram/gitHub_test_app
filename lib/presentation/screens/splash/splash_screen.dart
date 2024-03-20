import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_test/configs/constants/colors.dart';
import 'package:github_test/configs/constants/text_styles.dart';
import 'package:github_test/configs/router/navigation_service.dart';
import 'package:github_test/configs/router/pages.dart';
import 'package:github_test/data/source/local/strings/github_string_key.dart';
import 'package:github_test/data/source/local/strings/github_strings_map.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
        const Duration(milliseconds: 3000),
        () => navigationInstance
            .navigateWithReplaceTo(PageRouteName.searchScreen));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        top: false,
        bottom: false,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: GitHubColors.accentPrimary,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                GitHubStringKey.searchApp.localized(),
                style: headerMainStyle.copyWith(
                  color: GitHubColors.layerLater_1,
                ),
              ),
              const SizedBox(
                height: 16.0,
              ),
              const CupertinoActivityIndicator(
                color: GitHubColors.layerLater_1,
              )
            ],
          ),
        ),
      ),
    );
  }
}
