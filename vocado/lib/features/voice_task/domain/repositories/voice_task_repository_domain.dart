import 'package:vocado/features/voice_task/domain/entities/voice_task_entity.dart';

abstract class VoiceTaskRepositoryDomain {
  Future<VoiceTaskEntity> getVoiceTask();
  Future<void> startRecord();
}
