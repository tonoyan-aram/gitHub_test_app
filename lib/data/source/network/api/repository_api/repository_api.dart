import 'package:dio/dio.dart';
import 'package:github_test/data/source/network/constants/api_constants.dart';
import 'package:github_test/data/source/network/constants/api_end_points.dart';
import 'package:github_test/domain/models/page_model/page_model.dart';
import 'package:github_test/domain/models/repo_model/repo_model.dart';
import 'package:injectable/injectable.dart';

import 'package:retrofit/retrofit.dart';

part 'repository_api.g.dart';

@injectable
@RestApi(baseUrl: APIBase.url)
abstract class RepositoryApi {
  @factoryMethod
  factory RepositoryApi(Dio dio) = _RepositoryApi;

  @GET(EndPoint.getRepo)
  Future<PageModel<RepoModel>> getRepositories(
      @Queries() Map<String, String> queries);
}
