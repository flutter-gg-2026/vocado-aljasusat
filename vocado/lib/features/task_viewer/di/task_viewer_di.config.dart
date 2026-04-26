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
import 'package:vocado/core/services/authservice.dart' as _i65;
import 'package:vocado/features/task_viewer/data/datasources/task_viewer_remote_data_source.dart'
    as _i262;
import 'package:vocado/features/task_viewer/data/repositories/task_viewer_repository_data.dart'
    as _i132;
import 'package:vocado/features/task_viewer/domain/repositories/task_viewer_repository_domain.dart'
    as _i476;
import 'package:vocado/features/task_viewer/domain/use_cases/task_viewer_use_case.dart'
    as _i253;
import 'package:vocado/features/task_viewer/presentation/cubit/task_viewer_cubit.dart'
    as _i1070;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initTaskViewer({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i262.BaseTaskRemoteDataSource>(
      () => _i262.TaskRemoteDataSource(
        gh<_i454.SupabaseClient>(),
        gh<_i65.AuthService>(),
      ),
    );
    gh.lazySingleton<_i476.TaskRepository>(
      () => _i132.TaskRepositoryImpl(gh<_i262.BaseTaskRemoteDataSource>()),
    );
    gh.lazySingleton<_i253.TaskUseCase>(
      () => _i253.TaskUseCase(gh<_i476.TaskRepository>()),
    );
    gh.factory<_i1070.TaskViewerCubit>(
      () => _i1070.TaskViewerCubit(gh<_i253.TaskUseCase>()),
    );
    return this;
  }
}
