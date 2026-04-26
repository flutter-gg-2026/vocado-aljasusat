import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/voice_task/domain/entities/voice_task_entity.dart';
import 'package:vocado/features/voice_task/domain/repositories/voice_task_repository_domain.dart';

@lazySingleton
class VoiceTaskUseCase {
  final VoiceTaskRepositoryDomain _repositoryData;

  VoiceTaskUseCase(this._repositoryData);

  Future<Result<VoiceTaskEntity, Failure>> getVoiceTask() {
    return _repositoryData.getVoiceTask();
  }

  Future<Result<void, Failure>> startRecord() {
    return _repositoryData.startRecord();
  }

  Future<Result<void, Failure>> saveTask(VoiceTaskEntity task) {
    return _repositoryData.saveTask(task);
  }
}