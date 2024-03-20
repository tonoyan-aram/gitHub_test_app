import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:github_test/data/source/network/constants/api_constants.dart';
import 'package:github_test/data/source/network/interceptors/api_logging.dart';

@module
abstract class DioClient {

  @Named("baseUrl")
  String get baseUrl => APIBase.url;

  @lazySingleton
  Dio dio(@Named('baseUrl') String url) => Dio(BaseOptions(baseUrl: url))..interceptors.addAll([
    ApiLogging(),
  ]);
}