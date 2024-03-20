import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:github_test/data/repository/search_repository/search_repository.dart';
import 'package:github_test/domain/models/repo_model/repo_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SearchProvider extends ChangeNotifier {
  SearchRepository get _searchRepository => SearchRepository();
  final TextEditingController _searchController = TextEditingController();

  TextEditingController get searchController => _searchController;

  bool _isFirstLunch = true;
  bool get isFirstLunch => _isFirstLunch;

  List<RepoModel> _repositoryList = [];
  List<RepoModel> get repositoryList => _repositoryList;

  List<RepoModel> _repositoryHistoryList = [];
  List<RepoModel> get repositoryHistoryList => _repositoryHistoryList;
  List<String> _repositoryHistoryStringList = [];
  List<String> get repositoryHistoryStringList => _repositoryHistoryStringList;

  List<RepoModel> _favoriteRepositoryList = [];
  List<RepoModel> get favoriteRepositoryList => _favoriteRepositoryList;
  List<String> _favoriteRepositoryStringList = [];
  List<String> get favoriteRepositoryStringList =>
      _favoriteRepositoryStringList;
  List<int> _favoriteRepositoryIdList = [];
  List<int> get favoriteRepositoryIdList => _favoriteRepositoryIdList;
  List<String> _repositoryHistoryNameList = [];
  List<String> get repositoryHistoryNameList => _repositoryHistoryNameList;

  bool _loadingRepositories = false;
  bool get loadingRepositories => _loadingRepositories;
  bool _isLoadingFavorite = false;
  bool get isLoadingFavorite => _isLoadingFavorite;

  clearSearchController() {
    _searchController.text = "";
    notifyListeners();
  }

  bool checkFavorite(RepoModel repo) {
    return _favoriteRepositoryIdList.contains(repo.id);
  }

  setIsFirstLunchValue(bool value) {
    _isFirstLunch = value;
    notifyListeners();
  }

  addOrRemoveFavoriteRepository(RepoModel repo) async {
    if (_favoriteRepositoryIdList.contains(repo.id)) {
      _favoriteRepositoryIdList.remove(repo.id);

      var a = json.encode(repo);
      _favoriteRepositoryStringList.remove(a);

      final prefs = await SharedPreferences.getInstance();
      prefs.setString(
        "repoFavorite",
        jsonEncode(_favoriteRepositoryStringList),
      );
    } else {
      _favoriteRepositoryIdList.insert(0, repo.id ?? 0);
      _favoriteRepositoryList.insert(0, repo);
      var a = json.encode(repo);
      _favoriteRepositoryStringList.insert(0, a);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(
        "repoFavorite",
        jsonEncode(_favoriteRepositoryStringList),
      );
    }
    notifyListeners();
  }

  Future<void> getRepositories() async {
    _isFirstLunch = false;
    if (!_loadingRepositories) {
      _loadingRepositories = true;
      notifyListeners();
    }

    await _searchRepository
        .getRepositories(_searchController.text)
        .then((value) {
      addRepositoryHistoryLive(RepoModel(
          id: _repositoryHistoryList.length, name: _searchController.text));
      _loadingRepositories = false;
      if (value.items.isNotEmpty) {
        _repositoryList = value.items.map((e) => e).take(15).toList();
        notifyListeners();
      }
    });
  }

  addRepositoryHistory(String repo) {
    if (repo.isNotEmpty) {
      List<dynamic> repoList = json.decode(repo);
      _repositoryHistoryList =
          repoList.map((e) => RepoModel.fromJson(json.decode(e))).toList();
      _repositoryHistoryStringList =
          _repositoryHistoryList.map((e) => json.encode(e)).toList();
      _repositoryHistoryNameList =
          _repositoryHistoryList.map((e) => e.name).toList();
      notifyListeners();
    }
  }

  addRepositoryFavorite(String repo) {
    if (repo.isNotEmpty) {
      _isLoadingFavorite = true;
      notifyListeners();
      List<dynamic> repoList = json.decode(repo);
      _favoriteRepositoryList =
          repoList.map((e) => RepoModel.fromJson(json.decode(e))).toList();
      _favoriteRepositoryStringList =
          _favoriteRepositoryList.map((e) => json.encode(e)).toList();
      _favoriteRepositoryIdList =
          _favoriteRepositoryList.map((e) => e.id ?? 0).toList();
      _isLoadingFavorite = false;
      notifyListeners();
    }
  }

  addRepositoryHistoryLive(RepoModel repo) async {
    debugPrint("repo.name  ${repo.name}");
    var a = json.encode(repo);
    if (_repositoryHistoryNameList.contains(repo.name)) {
      return;
    } else {
      _repositoryHistoryNameList.add(repo.name);
      _repositoryHistoryStringList.insert(0, a);
      final prefs = await SharedPreferences.getInstance();
      prefs.setString(
        "repoHistory",
        jsonEncode(_repositoryHistoryStringList),
      );
    }
  }
}
