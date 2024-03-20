import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:github_test/configs/assets/assets.gen.dart';
import 'package:github_test/configs/constants/colors.dart';
import 'package:github_test/configs/constants/dimensions.dart';
import 'package:github_test/configs/constants/text_styles.dart';

class GitHubSearchField extends StatefulWidget {
  final TextEditingController? controller;
  final TextInputType? keyboardType;
  final String? hintText;
  final ValueChanged<String>? onChanged;
  final VoidCallback? onEditingComplete;
  final ValueChanged<String>? onFieldSubmitted;
  final FormFieldSetter<String>? onSaved;
  final List<TextInputFormatter>? inputFormatters;
  final Color? fillColor;
  final Color? focusedFillColor;
  final Color? cursorColor;
  final Color? focusedBorderColor;
  final EdgeInsetsGeometry? contentPadding;
  final double? borderRadius;
  final Color? borderColor;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;
  final VoidCallback? onClear;

  const GitHubSearchField({
    Key? key,
    required this.controller,
    this.hintText,
    this.keyboardType,
    this.onSaved,
    this.onChanged,
    this.onFieldSubmitted,
    this.onEditingComplete,
    this.focusNode,
    this.inputFormatters,
    this.fillColor = GitHubColors.layerLater_1,
    this.focusedFillColor = GitHubColors.accentSecondary,
    this.cursorColor = GitHubColors.accentPrimary,
    this.focusedBorderColor = GitHubColors.accentPrimary,
    this.borderRadius = kTextFieldDefaultBorderRadius,
    this.borderColor = GitHubColors.layerLater_1,
    this.contentPadding = kDefaultTextFieldPadding,
    this.textInputAction = TextInputAction.done,
    this.onClear,
  }) : super(key: key);

  @override
  State<GitHubSearchField> createState() => _GitHubSearchFieldState();
}

class _GitHubSearchFieldState extends State<GitHubSearchField> {
  bool _showClearButton = false;
  bool _isFocused = false;
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    widget.controller?.addListener(() {
      _showClearButton = widget.controller!.text.isNotEmpty;
      if (mounted) setState(() {});
    });
    _focusNode.addListener(() {
      if (_focusNode.hasFocus) {
        debugPrint("_focusNode.hasFocus  ${_focusNode.hasFocus}");
        setState(() {
          _isFocused = true;
        });
      } else {
        setState(() {
          _isFocused = false;
        });
      }
    });
  }

  _outlineBorder() {
    return OutlineInputBorder(
      borderRadius:
          BorderRadius.circular(widget.borderRadius ?? kDefaultBorderRadius),
      borderSide: BorderSide.none,
    );
  }

  _buildClearButton() {
    if (!_showClearButton) {
      return null;
    }
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: InkWell(
        onTap: () {
          widget.controller?.clear();
          if (widget.onClear != null) {
            widget.onClear!();
          }
        },
        splashColor: Colors.transparent,
        child: AppAssets.icons.clearIcon.svg(),
      ),
    );
  }

  _buildSearchIcon() {
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: AppAssets.icons.searchIcon.svg(),
    );
  }

  _focusedBorder(Color? clr) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(
        Radius.circular(widget.borderRadius ?? 20.0),
      ),
      borderSide:
          BorderSide(width: 2.0, color: clr ?? GitHubColors.backgroundMain),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(1.0),
      decoration: BoxDecoration(
        borderRadius:
            BorderRadius.circular(widget.borderRadius ?? kDefaultBorderRadius),
      ),
      child: TextFormField(
        key: widget.key,
        controller: widget.controller,
        onChanged: widget.onChanged,
        onFieldSubmitted: widget.onFieldSubmitted,
        onSaved: widget.onSaved,
        onEditingComplete: widget.onEditingComplete,
        inputFormatters: widget.inputFormatters,
        keyboardType: widget.keyboardType,
        focusNode: _focusNode,
        maxLines: 1,
        cursorColor: widget.cursorColor,
        style: bodyMainStyle.copyWith(color: GitHubColors.textPrimary),
        textInputAction: widget.textInputAction,
        decoration: InputDecoration(
          prefixIcon: _buildSearchIcon(),
          suffixIcon: _buildClearButton(),
          filled: true,
          fillColor: _isFocused ? widget.focusedFillColor : widget.fillColor,
          hintText: widget.hintText ?? "",
          focusedBorder: _focusedBorder(widget.focusedBorderColor),
          hintStyle:
              bodyMainStyle.copyWith(color: GitHubColors.textPlaceholder),
          contentPadding: widget.contentPadding,
          border: _outlineBorder(),
        ),
      ),
    );
  }
}
