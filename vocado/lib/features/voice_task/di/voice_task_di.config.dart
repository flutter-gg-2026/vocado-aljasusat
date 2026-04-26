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
import 'package:vocado/core/services/gemini_service.dart' as _i443;
import 'package:vocado/core/services/speech_service.dart' as _i1043;
import 'package:vocado/core/services/voice_service.dart' as _i231;
import 'package:vocado/features/voice_task/data/datasources/voice_task_remote_data_source.dart'
    as _i648;
import 'package:vocado/features/voice_task/data/repositories/voice_task_repository_data.dart'
    as _i696;
import 'package:vocado/features/voice_task/domain/repositories/voice_task_repository_domain.dart'
    as _i877;
import 'package:vocado/features/voice_task/domain/use_cases/voice_task_use_case.dart'
    as _i440;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt initVoiceTask({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.lazySingleton<_i648.BaseVoiceTaskRemoteDataSource>(
      () => _i648.VoiceTaskRemoteDataSource(
        gh<_i231.VoiceService>(),
        gh<_i1043.SpeechService>(),
        gh<_i443.GeminiService>(),
        gh<_i454.SupabaseClient>(),
        gh<_i65.AuthService>(),
      ),
    );
    gh.lazySingleton<_i877.VoiceTaskRepositoryDomain>(
      () => _i696.VoiceTaskRepositoryData(
        gh<_i648.BaseVoiceTaskRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i440.VoiceTaskUseCase>(
      () => _i440.VoiceTaskUseCase(gh<_i877.VoiceTaskRepositoryDomain>()),
    );
    return this;
  }
}
