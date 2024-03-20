import 'package:github_test/data/di/injection.dart';
import 'package:github_test/data/source/network/api/repository_api/repository_api.dart';
import 'package:github_test/domain/models/page_model/page_model.dart';
import 'package:github_test/domain/models/repo_model/repo_model.dart';

class SearchRepository {
  RepositoryApi get _repositoryApi => getIt<RepositoryApi>();

  Future<PageModel<RepoModel>> getRepositories(String name) async {
    return await _repositoryApi.getRepositories({"q": name}).then((value) {
      return value;
    }).catchError((_) {
      return [];
    });
  }
}
