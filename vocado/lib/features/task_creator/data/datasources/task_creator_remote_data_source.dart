import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/features/task_creator/data/models/task_creator_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTaskCreatorRemoteDataSource {
  Future<List<TaskCreatorModel>> getTaskCreator();
}


@LazySingleton(as: BaseTaskCreatorRemoteDataSource)
class TaskCreatorRemoteDataSource implements BaseTaskCreatorRemoteDataSource {
  final SupabaseClient _supabase;

  TaskCreatorRemoteDataSource(this._supabase);

  @override
Future<List<TaskCreatorModel>> getTaskCreator() async {
  try {
    final response = await _supabase
        .from('task')
        .select()
        .order('id', ascending: false);

    return response
        .map<TaskCreatorModel>((json) => TaskCreatorModel.fromJson(json))
        .toList();
  } catch (error) {
    throw FailureExceptions.getException(error);
  }
}
}
