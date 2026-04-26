import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/errors/network_exceptions.dart';
import 'package:vocado/features/task_viewer/data/models/task_model.dart';

abstract class BaseTaskRemoteDataSource {
  Future<List<TaskModel>> getTasks();

  Future<void> updateStatus({
    required int id,
    required String status,
  });
}

@LazySingleton(as: BaseTaskRemoteDataSource)
class TaskRemoteDataSource implements BaseTaskRemoteDataSource {
  final SupabaseClient _supabase;

  TaskRemoteDataSource(this._supabase);

  @override
  Future<List<TaskModel>> getTasks() async {
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
            description,
            due_date,
            status,
            user_id,
            assigned_by
          ''')
          .eq('user_id', currentUser.id)
          .order('id', ascending: false);

      return response.map<TaskModel>((json) {
        final data = Map<String, dynamic>.from(json);

        return TaskModel.fromJson({
          'id': data['id'],
          'title': data['name'] ?? '',
          'description': data['description'] ?? '',
          'assignedBy': data['assigned_by'] ?? '',
          'deadline': data['due_date'] ?? DateTime.now().toIso8601String(),
          'status': data['status'] ?? 'Pending',
        });
      }).toList();
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }

  @override
  Future<void> updateStatus({
    required int id,
    required String status,
  }) async {
    try {
      final currentUser = _supabase.auth.currentUser;

      if (currentUser == null) {
        throw Exception('Authentication required');
      }

      await _supabase
          .from('task')
          .update({'status': status})
          .eq('id', id)
          .eq('user_id', currentUser.id);
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}