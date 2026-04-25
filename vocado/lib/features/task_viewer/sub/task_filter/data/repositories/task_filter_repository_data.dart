
import 'package:injectable/injectable.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/core/errors/failure.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/entities/task_filter_entity.dart';

import 'package:vocado/features/task_viewer/sub/task_filter/data/datasources/task_filter_remote_data_source.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/data/models/task_filter_model.dart';
import 'package:vocado/features/task_viewer/sub/task_filter/domain/repositories/task_filter_repository_domain.dart';

@LazySingleton(as: TaskFilterRepositoryDomain)

class TaskFilterRepositoryData implements TaskFilterRepositoryDomain{
  final BaseTaskFilterRemoteDataSource remoteDataSource;


  TaskFilterRepositoryData(this.remoteDataSource);
@override
Future<Result<List<TaskFilterEntity>, Failure>> getTaskFilter() async {
  try {
    final response = await remoteDataSource.getTaskFilter();

    return Success(
      response.map((e) => e.toEntity()).toList(),
    );
    
  } catch (error) {
    return Error(FailureExceptions.getException(error));
  }
}}

