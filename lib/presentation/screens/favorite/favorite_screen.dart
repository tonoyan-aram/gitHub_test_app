import 'package:after_layout/after_layout.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:github_test/configs/assets/assets.gen.dart';
import 'package:github_test/configs/constants/colors.dart';
import 'package:github_test/configs/constants/dimensions.dart';
import 'package:github_test/configs/constants/text_styles.dart';
import 'package:github_test/configs/router/navigation_service.dart';
import 'package:github_test/data/source/local/strings/github_string_key.dart';
import 'package:github_test/data/source/local/strings/github_strings_map.dart';
import 'package:github_test/presentation/screens/main/search_provider.dart';
import 'package:github_test/presentation/widgets/buttons/icon_button.dart';
import 'package:github_test/presentation/widgets/cards/repository_card/repository_card.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoriteScreen extends StatefulWidget {
  const FavoriteScreen({super.key});

  @override
  State<FavoriteScreen> createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> with AfterLayoutMixin {
  String repoFavorite = "";
  SearchProvider? _searchProvider;
  @override
  afterFirstLayout(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    repoFavorite = prefs.getString("repoFavorite") ?? "";

    _searchProvider?.addRepositoryFavorite(repoFavorite);
    if (mounted) {
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();
    _searchProvider = context.read<SearchProvider>();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: GitHubColors.backgroundMain,
      appBar: AppBar(
        elevation: 0.0,
        automaticallyImplyLeading: false,
        centerTitle: true,
        leadingWidth: 76,
        backgroundColor: GitHubColors.backgroundMain,
        title: Text(
          GitHubStringKey.favoriteAppBarTitle.localized(),
          style: headerMainStyle.copyWith(
            color: GitHubColors.textPrimary,
          ),
        ),
        leading: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
            vertical: 6.0,
            // vertical: 6.0,
          ),
          child: GitHubIconButton(
            onPressed: () {
              navigationInstance.pop();
            },
            iconData: AppAssets.icons.backButtonIcon.svg(),
          ),
        ),
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
              data.isLoadingFavorite
                  ? const Center(
                      child: CupertinoActivityIndicator(),
                    )
                  : _buildSearchResultRepositories(data),
            ],
          );
        }),
      ),
    );
  }

  _buildSearchResultRepositories(SearchProvider data) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding)
            .copyWith(top: 24.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              if (data.favoriteRepositoryList.isNotEmpty)
                for (var repo in data.favoriteRepositoryList)
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
                  padding: const EdgeInsets.only(top: 160.0),
                  child: Center(
                    child: Text(
                      GitHubStringKey.searchFavoriteEmptyText.localized(),
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
    );
  }
}
