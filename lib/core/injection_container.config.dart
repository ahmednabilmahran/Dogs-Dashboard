// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../features/dashboard/data/datasources/dashboard_remote_datasource.dart'
    as _i3;
import '../features/dashboard/data/repositories/dashboard_repo_impl.dart'
    as _i5;
import '../features/dashboard/domain/repositories/dashboard_repo.dart' as _i4;
import '../features/dashboard/domain/usecases/get_images_list_by_breed.dart'
    as _i7;
import '../features/dashboard/domain/usecases/get_images_list_by_sub_breed.dart'
    as _i8;
import '../features/dashboard/domain/usecases/get_random_image_by_breed.dart'
    as _i9;
import '../features/dashboard/domain/usecases/get_random_image_by_sub_breed.dart'
    as _i10;
import '../features/splash/data/datasources/splash_local_datasource.dart'
    as _i11;
import '../features/splash/data/repositories/splash_repo_impl.dart' as _i13;
import '../features/splash/domain/repositories/splash_repo.dart' as _i12;
import '../features/splash/domain/usecases/change_lang.dart' as _i14;
import '../features/splash/domain/usecases/change_theme_mode.dart' as _i15;
import '../features/splash/domain/usecases/get_saved_lang.dart' as _i16;
import '../features/splash/domain/usecases/get_saved_theme_mode.dart' as _i17;
import 'utils/database_manager.dart' as _i6;

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
    gh.lazySingleton<_i3.DashboardRemoteDataSource>(
        () => _i3.DashboardRemoteDataSourceImpl());
    gh.lazySingleton<_i4.DashboardRepo>(() => _i5.DashboardRepoImpl(
        dashboardRemoteDataSource: gh<_i3.DashboardRemoteDataSource>()));
    gh.lazySingleton<_i6.DatabaseManager>(() => _i6.DatabaseManager());
    gh.lazySingleton<_i7.GetImagesListByBreedUseCase>(() =>
        _i7.GetImagesListByBreedUseCase(
            dashboardRepo: gh<_i4.DashboardRepo>()));
    gh.lazySingleton<_i8.GetImagesListBySubBreedUseCase>(() =>
        _i8.GetImagesListBySubBreedUseCase(
            dashboardRepo: gh<_i4.DashboardRepo>()));
    gh.lazySingleton<_i9.GetRandomImageByBreedUseCase>(() =>
        _i9.GetRandomImageByBreedUseCase(
            dashboardRepo: gh<_i4.DashboardRepo>()));
    gh.lazySingleton<_i10.GetRandomImageBySubBreedUseCase>(() =>
        _i10.GetRandomImageBySubBreedUseCase(
            dashboardRepo: gh<_i4.DashboardRepo>()));
    gh.lazySingleton<_i11.SplashLocalDataSource>(
        () => _i11.SplashLocalDataSourceImpl());
    gh.lazySingleton<_i12.SplashRepo>(() => _i13.SplashRepoImpl(
        splashLocalDataSource: gh<_i11.SplashLocalDataSource>()));
    gh.lazySingleton<_i14.ChangeLangUseCase>(
        () => _i14.ChangeLangUseCase(splashRepo: gh<_i12.SplashRepo>()));
    gh.lazySingleton<_i15.ChangeThemeModeUseCase>(
        () => _i15.ChangeThemeModeUseCase(splashRepo: gh<_i12.SplashRepo>()));
    gh.lazySingleton<_i16.GetSavedLangUseCase>(
        () => _i16.GetSavedLangUseCase(splashRepo: gh<_i12.SplashRepo>()));
    gh.lazySingleton<_i17.GetSavedThemeModeUseCase>(
        () => _i17.GetSavedThemeModeUseCase(splashRepo: gh<_i12.SplashRepo>()));
    return this;
  }
}
