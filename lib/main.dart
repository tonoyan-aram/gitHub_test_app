import 'package:flutter/material.dart';
import 'package:github_test/data/source/local/preferences/preferences.dart';
import 'package:github_test/github_app.dart';

import 'data/di/injection.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Preferences.instance.getSharedInstance();
  configureDependencies();
  runApp(const GitHubApp());
}
