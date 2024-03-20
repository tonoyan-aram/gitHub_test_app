import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:github_test/configs/constants/colors.dart';
import 'package:github_test/configs/constants/dimensions.dart';

class GitHubIconButton extends StatelessWidget {
  final SvgPicture iconData;
  final bool isEnable;
  final Color backgroundColor;
  final Color highlightedBackgroundColor;
  final Color disableBackgroundColor;
  final double borderRadius;
  final VoidCallback? onPressed;
  const GitHubIconButton({
    Key? key,
    required this.iconData,
    this.isEnable = true,
    this.borderRadius = kDefaultBorderRadius,
    this.backgroundColor = GitHubColors.accentPrimary,
    this.disableBackgroundColor = GitHubColors.layerLater_1,
    this.highlightedBackgroundColor = GitHubColors.accentSecondary,
    this.onPressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return IconButton.filledTonal(
      onPressed: onPressed,
      icon: iconData,
      style: IconButton.styleFrom(
          enableFeedback: isEnable,
          backgroundColor: backgroundColor,
          highlightColor: highlightedBackgroundColor,
          disabledBackgroundColor: disableBackgroundColor,
          maximumSize: const Size.square(44.0),
          minimumSize: const Size.square(44.0),
          alignment: Alignment.center,
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultBorderRadius))),
    );
  }
}
