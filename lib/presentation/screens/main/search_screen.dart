import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_test/configs/assets/assets.gen.dart';
import 'package:github_test/configs/constants/colors.dart';
import 'package:github_test/configs/constants/dimensions.dart';
import 'package:github_test/configs/constants/text_styles.dart';
import 'package:github_test/configs/router/navigation_service.dart';
import 'package:github_test/configs/router/pages.dart';
import 'package:github_test/data/source/local/strings/github_string_key.dart';
import 'package:github_test/data/source/local/strings/github_strings_map.dart';
import 'package:github_test/presentation/screens/main/search_provider.dart';
import 'package:github_test/presentation/widgets/buttons/icon_button.dart';
import 'package:github_test/presentation/widgets/cards/repository_card/repository_card.dart';
import 'package:github_test/presentation/widgets/text_fields/search_text_field.dart';
import 'package:provider/provider.dart';
import 'package:after_layout/after_layout.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with AfterLayoutMixin {
  SearchProvider? _searchProvider;
  bool isFirst = true;
  String repoHistory = "";
  String repoFavorite = "";
  @override
  afterFirstLayout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    isFirst = prefs.getBool("isFirst") ?? true;
    repoHistory = prefs.getString("repoHistory") ?? "";
    repoFavorite = prefs.getString("repoFavorite") ?? "";

    _searchProvider?.addRepositoryFavorite(repoFavorite);

    _searchProvider?.addRepositoryHistory(repoHistory);
    if (mounted) {
      setState(() {});
    }
    _searchProvider?.setIsFirstLunchValue(isFirst);
  }

  @override
  void initState() {
    super.initState();
    _searchProvider = context.read<SearchProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: GitHubColors.backgroundMain,
        appBar: AppBar(
          elevation: 0.0,
          automaticallyImplyLeading: false,
          centerTitle: true,
          backgroundColor: GitHubColors.backgroundMain,
          title: Text(
            GitHubStringKey.searchAppBarTitle.localized(),
            style: headerMainStyle.copyWith(
              color: GitHubColors.textPrimary,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
              ),
              child: GitHubIconButton(
                onPressed: () {
                  FocusScope.of(context).unfocus();
                  navigationInstance.navigateTo(PageRouteName.favoriteScreen);
                },
                iconData: AppAssets.icons.favoriteButtonIcon.svg(),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Consumer<SearchProvider>(builder: (context, data, _) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Divider(
                  height: 5.0,
                  color: GitHubColors.layerLater_1,
                ),
                Padding(
                  padding: const EdgeInsets.all(kDefaultPadding),
                  child: GitHubSearchField(
                    controller: data.searchController,
                    hintText: GitHubStringKey.searchFieldHint.localized(),
                    onClear: () {
                      data.clearSearchController();
                    },
                    onEditingComplete: () {},
                    onFieldSubmitted: (String v) async {
                      FocusManager.instance.primaryFocus?.unfocus();
                      data.getRepositories();
                    },
                  ),
                ),
                data.loadingRepositories
                    ? const Center(
                        child: CupertinoActivityIndicator(),
                      )
                    : data.isFirstLunch
                        ? _buildSearchHistory(data)
                        : _buildSearchResultRepositories(data),
              ],
            );
          }),
        ),
      ),
    );
  }

  _buildSearchResultRepositories(SearchProvider data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                GitHubStringKey.searchRepositoryTitle.localized(),
                style: headerMainStyle.copyWith(
                  color: GitHubColors.accentPrimary,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (data.repositoryList.isNotEmpty)
                      for (var repo in data.repositoryList)
                        RepositoryCard(
                          id: repo.id ?? 0,
                          repositoryName: repo.name,
                          isFavorite: data.checkFavorite(repo),
                          withFavorite: true,
                          onTap: () {
                            data.addOrRemoveFavoriteRepository(repo);
                          },
                        )
                    else
                      Padding(
                        padding: const EdgeInsets.only(top: 184.0),
                        child: Center(
                          child: Text(
                            GitHubStringKey.searchRepositoryEmptyText
                                .localized(),
                            textAlign: TextAlign.center,
                            style: bodyMainStyle.copyWith(
                              color: GitHubColors.textPlaceholder,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  _buildSearchHistory(SearchProvider data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: Text(
                GitHubStringKey.searchHistoryTitle.localized(),
                style: headerMainStyle.copyWith(
                  color: GitHubColors.accentPrimary,
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    if (data.repositoryHistoryList.isNotEmpty)
                      for (var repo in data.repositoryHistoryList)
                        RepositoryCard(
                          id: repo.id ?? 0,
                          repositoryName: repo.name,
                          isFavorite: false,
                          withFavorite: false,
                          onTap: () {},
                        )
                    else
                      Padding(
                        padding: const EdgeInsets.only(top: 184.0),
                        child: Center(
                          child: Text(
                            GitHubStringKey.searchHistoryEmptyText.localized(),
                            textAlign: TextAlign.center,
                            style: bodyMainStyle.copyWith(
                              color: GitHubColors.textPlaceholder,
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
