import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/voice_task/domain/entities/voice_task_entity.dart';

abstract class VoiceTaskRepositoryDomain {
  Future<Result<VoiceTaskEntity, Failure>> getVoiceTask();
  Future<Result<void, Failure>> startRecord();
  Future<Result<void, Failure>> saveTask(VoiceTaskEntity task);
}
