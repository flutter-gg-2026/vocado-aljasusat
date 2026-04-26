import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/authservice.dart';
import '../models/task_model.dart';

abstract class BaseTaskRemoteDataSource {
  Future<List<TaskModel>> getTasks();
  Future<void> updateStatus(int id, String status);
}

@LazySingleton(as: BaseTaskRemoteDataSource)
class TaskRemoteDataSource implements BaseTaskRemoteDataSource {
  final SupabaseClient _supabase;
final AuthService authService;
  TaskRemoteDataSource(this._supabase,this.authService);

  @override
  Future<List<TaskModel>> getTasks() async {
   final user = await authService.getCurrentUser();

if (user == null) {
  throw Exception("Session expired");

    }

    final response = await _supabase
        .from('task')
        .select()
        .eq('assignee_id', user.id);

    return (response as List)
        .map(
          (e) => TaskModel.fromJson({
            'id': e['id'],
            'title': e['name'] ?? '',
            'description': e['description'] ?? '',
            'assignedBy': e['assigned_by'] ?? '',
            'deadline': e['due_date'] ?? '',
            'status': e['status'] ?? 'pending',
          }),
        )
        .toList();
  }

  @override
  Future<void> updateStatus(int id, String status) async {
    final user = await authService.getCurrentUser();

if (user == null) {
  throw Exception("Session expired");
}

    final response = await _supabase
        .from('task')
        .update({'status': status})
        .eq('id', id)
        .eq('assignee_id', user.id)
        .select();
  }
}
