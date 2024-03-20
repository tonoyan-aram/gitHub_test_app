import 'package:flutter/material.dart';
import 'package:github_test/configs/assets/assets.gen.dart';
import 'package:github_test/configs/constants/colors.dart';
import 'package:github_test/configs/constants/dimensions.dart';
import 'package:github_test/configs/constants/text_styles.dart';

class RepositoryCard extends StatelessWidget {
  const RepositoryCard({
    required this.repositoryName,
    required this.id,
    required this.onTap,
    required this.isFavorite,
    required this.withFavorite,
    super.key,
  });

  final int id;
  final String repositoryName;
  final bool isFavorite;
  final bool withFavorite;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: Container(
          padding: const EdgeInsets.all(kDefaultPadding),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(kCardDefaultBorderRadius),
            color: GitHubColors.layerLater_1,
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  repositoryName,
                  style:
                      bodyMainStyle.copyWith(color: GitHubColors.textPrimary),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              if (withFavorite)
                InkWell(
                  onTap: onTap,
                  child: isFavorite
                      ? AppAssets.icons.favoriteActiveIcon.svg()
                      : AppAssets.icons.favoriteInactiveIcon.svg(),
                )
            ],
          ),
        ),
      ),
    );
  }
}
