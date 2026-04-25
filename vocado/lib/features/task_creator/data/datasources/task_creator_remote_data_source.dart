import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/features/task_creator/data/models/task_creator_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseTaskCreatorRemoteDataSource {
  Future<List<TaskCreatorModel>> getTaskCreator();
  Future<void> deleteTask(int id);
  Future<void> updateTask({
    required int id,
    required String name,
    required String description,
    required String dueDate,
  });
}

@LazySingleton(as: BaseTaskCreatorRemoteDataSource)
class TaskCreatorRemoteDataSource implements BaseTaskCreatorRemoteDataSource {
  final SupabaseClient _supabase;

  TaskCreatorRemoteDataSource(this._supabase);

  @override
  Future<List<TaskCreatorModel>> getTaskCreator() async {
    try {
      final currentUser = _supabase.auth.currentUser;

      if (currentUser == null) {
        throw Exception('Authentication required');
      }

      final response = await _supabase
          .from('task')
          .select('''
      id,
      name,
      status,
      due_date,
      user_id,
      assigned_by,
      description,
      users(name)
    ''')
          .order('id', ascending: false);

      return response.map<TaskCreatorModel>((json) {
        final data = Map<String, dynamic>.from(json);

        data['assignee_name'] = data['assignee_name'] ?? data['assigned_by'];

        return TaskCreatorModel.fromJson(data);
      }).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> deleteTask(int id) async {
    try {
      await _supabase.from('task').delete().eq('id', id);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> updateTask({
    required int id,
    required String name,
    required String description,
    required String dueDate,
  }) async {
    try {
      await _supabase
          .from('task')
          .update({
            'name': name,
            'description': description,
            'due_date': dueDate,
          })
          .eq('id', id);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
