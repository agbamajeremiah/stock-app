// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:connectivity/connectivity.dart' as _i6;
import 'package:dio/dio.dart' as _i7;
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:internet_connection_checker/internet_connection_checker.dart'
    as _i9;
import 'package:package_info/package_info.dart' as _i11;

import '../../ui/features/auth/data/datasources/auth_remote_datasource.dart'
    as _i3;
import '../../ui/features/auth/data/repositories/auth_repository_impl.dart'
    as _i5;
import '../../ui/features/auth/domain/repositories/auth_repository.dart' as _i4;
import '../../ui/features/auth/presentation/providers/auth_provider.dart'
    as _i12;
import '../../ui/features/home/data/datasources/home_remote_datasource.dart'
    as _i13;
import '../../ui/features/home/data/repositories/home_repository_impl.dart'
    as _i15;
import '../../ui/features/home/domain/repositories/home_repository.dart'
    as _i14;
import '../../ui/features/home/presentation/providers/home_provider.dart'
    as _i16;
import '../network/http_requester.dart' as _i8;
import '../network/network_info.dart' as _i10;
import 'register_module.dart' as _i17; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
Future<_i1.GetIt> $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) async {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  final registerModule = _$RegisterModule();
  gh.lazySingleton<_i3.AuthRemoteDatasource>(
      () => _i3.AuthRemoteDatasourceImpl());
  gh.lazySingleton<_i4.AuthRepository>(() => _i5.AuthRepositoryImpl(
      remoteDatasource: get<_i3.AuthRemoteDatasource>()));
  gh.factory<_i6.Connectivity>(() => registerModule.connectivity);
  gh.factory<_i7.Dio>(() => registerModule.dio);
  gh.lazySingleton<_i8.HttpServiceRequester>(
      () => _i8.HttpServiceRequester(dio: get<_i7.Dio>()));
  gh.factory<_i9.InternetConnectionChecker>(
      () => registerModule.internetConnectionChecker);
  gh.lazySingleton<_i10.NetworkInfo>(
      () => _i10.NetworkInfoImpl(get<_i9.InternetConnectionChecker>()));
  await gh.factoryAsync<_i11.PackageInfo>(() => registerModule.packageInfo,
      preResolve: true);
  gh.lazySingleton<_i12.AuthProvider>(
      () => _i12.AuthProvider(authRepository: get<_i4.AuthRepository>()));
  gh.lazySingleton<_i13.HomeRemoteDatasource>(() =>
      _i13.HomeRemoteDatasourceImpl(
          networkInfo: get<_i10.NetworkInfo>(),
          httpServiceRequester: get<_i8.HttpServiceRequester>()));
  gh.lazySingleton<_i14.HomeRepository>(() => _i15.HomeRepositoryImpl(
      homeRemoteDatasource: get<_i13.HomeRemoteDatasource>()));
  gh.lazySingleton<_i16.HomeProvider>(
      () => _i16.HomeProvider(homeRepository: get<_i14.HomeRepository>()));
  return get;
}

class _$RegisterModule extends _i17.RegisterModule {}
