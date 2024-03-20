// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i3;
import 'package:get_it/get_it.dart' as _i1;
import 'package:github_test/data/source/network/api/repository_api/repository_api.dart'
    as _i4;
import 'package:github_test/data/source/network/dio_client/dio_client.dart'
    as _i5;
import 'package:injectable/injectable.dart' as _i2;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  _i1.GetIt init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final dioClient = _$DioClient();
    gh.factory<String>(
      () => dioClient.baseUrl,
      instanceName: 'baseUrl',
    );
    gh.lazySingleton<_i3.Dio>(
        () => dioClient.dio(gh<String>(instanceName: 'baseUrl')));
    gh.factory<_i4.RepositoryApi>(() => _i4.RepositoryApi(gh<_i3.Dio>()));
    return this;
  }
}

class _$DioClient extends _i5.DioClient {}
