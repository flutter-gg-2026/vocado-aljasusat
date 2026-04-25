// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:supabase_flutter/supabase_flutter.dart' as _i454;
import 'package:vocado/core/services/local_keys_service.dart' as _i140;
import 'package:vocado/features/bottom_nav/data/datasources/bottom_nav_remote_data_source.dart'
    as _i521;
import 'package:vocado/features/bottom_nav/data/repositories/bottom_nav_repository_data.dart'
    as _i680;
import 'package:vocado/features/bottom_nav/domain/repositories/bottom_nav_repository_domain.dart'
    as _i584;
import 'package:vocado/features/bottom_nav/domain/use_cases/bottom_nav_use_case.dart'
    as _i531;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initBottomNav({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i521.BaseBottomNavRemoteDataSource>(
      () => _i521.BottomNavRemoteDataSource(
        gh<_i140.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i584.BottomNavRepositoryDomain>(
      () => _i680.BottomNavRepositoryData(
        gh<_i521.BaseBottomNavRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i531.BottomNavUseCase>(
      () => _i531.BottomNavUseCase(gh<_i584.BottomNavRepositoryDomain>()),
    );
    return this;
  }
}
