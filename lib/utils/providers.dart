import 'package:github_test/presentation/screens/main/search_provider.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get providers => _providers;
List<SingleChildWidget> _providers = [
  ChangeNotifierProvider<SearchProvider>(
    create: (_) => SearchProvider(),
  ),
];
