import 'package:injectable/injectable.dart';
import 'package:vocado/features/voice_task/domain/entities/voice_task_entity.dart';
import 'package:vocado/features/voice_task/domain/repositories/voice_task_repository_domain.dart';

@lazySingleton
class VoiceTaskUseCase {
  final VoiceTaskRepositoryDomain _repositoryData;

  VoiceTaskUseCase(this._repositoryData);

  Future<VoiceTaskEntity> getVoiceTask() async {
    return await _repositoryData.getVoiceTask();
  }

  Future<void> startRecord() async {
    await _repositoryData.startRecord();
  }
}