import 'package:github_test/data/source/local/strings/github_string_key.dart';

extension StringKey on String {
  String localized() =>
      _appStrings.containsKey(this) && _appStrings[this] != null
          ? _appStrings[this]!
          : this;
}

const Map<String, String> _appStrings = {
  GitHubStringKey.searchApp: "Search App",
  GitHubStringKey.searchAppBarTitle: "Github repos list",
  GitHubStringKey.favoriteAppBarTitle: "Favorite repos list",
  GitHubStringKey.searchFieldHint: "Search",
  GitHubStringKey.searchHistoryTitle: "Search History",
  GitHubStringKey.searchRepositoryTitle: "What we have found",
  GitHubStringKey.searchHistoryEmptyText:
      "You have empty history.\nClick on search to start journey!",
  GitHubStringKey.searchRepositoryEmptyText:
      "Nothing was find for your search.\nPlease check the spelling",
  GitHubStringKey.searchFavoriteEmptyText:
      "You have no favorites.\nClick on star while searching to add first favorite",
};
