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
import 'package:vocado/features/team/data/datasources/team_remote_data_source.dart'
    as _i736;
import 'package:vocado/features/team/data/repositories/team_repository_data.dart'
    as _i354;
import 'package:vocado/features/team/domain/repositories/team_repository_domain.dart'
    as _i45;
import 'package:vocado/features/team/domain/use_cases/team_use_case.dart'
    as _i851;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTeam({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i736.BaseTeamRemoteDataSource>(
      () => _i736.TeamRemoteDataSource(
        gh<_i140.LocalKeysService>(),
        gh<_i454.SupabaseClient>(),
      ),
    );
    gh.lazySingleton<_i45.TeamRepositoryDomain>(
      () => _i354.TeamRepositoryData(gh<_i736.BaseTeamRemoteDataSource>()),
    );
    gh.lazySingleton<_i851.TeamUseCase>(
      () => _i851.TeamUseCase(gh<_i45.TeamRepositoryDomain>()),
    );
    return this;
  }
}
