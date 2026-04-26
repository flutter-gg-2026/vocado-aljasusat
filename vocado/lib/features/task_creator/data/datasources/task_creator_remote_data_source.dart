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
  Future<String> getCurrentUserName();
}

@LazySingleton(as: BaseTaskCreatorRemoteDataSource)
class TaskCreatorRemoteDataSource implements BaseTaskCreatorRemoteDataSource {
  final SupabaseClient _supabase;

  TaskCreatorRemoteDataSource(this._supabase);

  @override
  Future<List<TaskCreatorModel>> getTaskCreator() async {
    try {
      final session = _supabase.auth.currentSession;
      if (session == null || session.isExpired) {
        throw Exception('Invalid token');
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
      users!tasks_user_id_fkey(name)
    ''')
          .order('id', ascending: false);

      final today = DateTime.now();

      for (final task in response) {
        final dueDateString = task['due_date'];

        if (dueDateString == null || dueDateString.toString().isEmpty) {
          continue;
        }

        final dueDate = DateTime.tryParse(dueDateString);

        if (dueDate == null) continue;

        final isLate = dueDate.isBefore(
          DateTime(today.year, today.month, today.day),
        );

        final isCompleted =
            (task['status'] ?? '').toString().toLowerCase() == 'completed';

        if (isLate && !isCompleted && task['status'] != 'Late') {
          await _supabase
              .from('task')
              .update({'status': 'Late'})
              .eq('id', task['id']);

          task['status'] = 'Late';
        }
      }

      return response.map<TaskCreatorModel>((json) {
        final data = Map<String, dynamic>.from(json);

        data['assignee_name'] =
            data['users']?['name'] ?? data['assigned_by'] ?? '';

        data['status'] ??= 'Pending';
        data['due_date'] ??= '';
        data['id'] ??= '';
        data['name'] ??= '';

        return TaskCreatorModel.fromJson(data);
      }).toList();
    } catch (error) {
      print('TASK CREATOR ERROR: $error');
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

  @override
  Future<String> getCurrentUserName() async {
    try {
      final session = _supabase.auth.currentSession;
      if (session == null || session.isExpired) {
        throw Exception('Invalid token');
      }
      final user = session.user;

      final response = await _supabase
          .from('users')
          .select('name')
          .eq('id', user.id)
          .single();

      return response['name'] ?? 'User';
    } catch (error) {
      throw FailureExceptions.getException(error);
    }
  }
}
