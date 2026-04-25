import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/voice_task/data/models/voice_task_model.dart';
import 'package:vocado/features/voice_task/domain/entities/voice_task_entity.dart';
import 'package:vocado/features/voice_task/data/datasources/voice_task_remote_data_source.dart';
import 'package:vocado/features/voice_task/domain/repositories/voice_task_repository_domain.dart';

@LazySingleton(as: VoiceTaskRepositoryDomain)
class VoiceTaskRepositoryData implements VoiceTaskRepositoryDomain {
  final BaseVoiceTaskRemoteDataSource remoteDataSource;

  VoiceTaskRepositoryData(this.remoteDataSource);

  @override
  Future<Result<VoiceTaskEntity, Failure>> getVoiceTask() async {
    try {
      final model = await remoteDataSource.getVoiceTask();
      return Result.success(model.toEntity());
    } catch (e) {
      return Result.error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void, Failure>> startRecord() async {
    try {
      await remoteDataSource.startRecord();
      return Result.success(null);
    } catch (e) {
      return Result.error(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Result<void, Failure>> saveTask(VoiceTaskEntity task) async {
    try {
      final model = task.toModel();
      await remoteDataSource.insertTask(model);
      return Result.success(null);
    } catch (e) {
      return Result.error(ServerFailure(e.toString()));
    }
  }
}
