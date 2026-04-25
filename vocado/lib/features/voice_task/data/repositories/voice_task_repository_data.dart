
import 'package:injectable/injectable.dart';
import 'package:vocado/features/voice_task/domain/entities/voice_task_entity.dart';

import 'package:vocado/features/voice_task/data/datasources/voice_task_remote_data_source.dart';
import 'package:vocado/features/voice_task/data/models/voice_task_model.dart';
import 'package:vocado/features/voice_task/domain/repositories/voice_task_repository_domain.dart';

@LazySingleton(as: VoiceTaskRepositoryDomain)
class VoiceTaskRepositoryData implements VoiceTaskRepositoryDomain {
  final BaseVoiceTaskRemoteDataSource remoteDataSource;

  VoiceTaskRepositoryData(this.remoteDataSource);

  @override
  Future<VoiceTaskEntity> getVoiceTask() async {
    final model = await remoteDataSource.getVoiceTask();
    return model.toEntity();
  }

  @override
  Future<void> startRecord() async {
    await remoteDataSource.startRecord();
  }
}
