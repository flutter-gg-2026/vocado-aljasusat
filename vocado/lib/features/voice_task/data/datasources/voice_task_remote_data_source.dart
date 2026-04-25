import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/gemini_service.dart';
import 'package:vocado/core/services/speech_service.dart';
import 'package:vocado/core/services/voice_service.dart';
import 'package:vocado/features/voice_task/data/models/voice_task_model.dart';

abstract class BaseVoiceTaskRemoteDataSource {
  Future<VoiceTaskModel> getVoiceTask();
  Future<void> startRecord();
  Future<void> insertTask(VoiceTaskModel task);
}

@LazySingleton(as: BaseVoiceTaskRemoteDataSource)
class VoiceTaskRemoteDataSource implements BaseVoiceTaskRemoteDataSource {
  final VoiceService voiceService;
  final SpeechService speechService;
  final GeminiService geminiService;
  final SupabaseClient _supabase;

  VoiceTaskRemoteDataSource(
    this.voiceService,
    this.speechService,
    this.geminiService,
    this._supabase,
  );

  String mapStatus(String status) {
    switch (status) {
      case "Completed":
        return "Completed";
      case "late":
        return "Late";
      default:
        return "Pending";
    }
  }

  @override
  Future<VoiceTaskModel> getVoiceTask() async {
    final path = await voiceService.stopRecord();

    if (path == null) {
      throw Exception("No audio recorded");
    }

    final text = await speechService.processAudio(path);

    if (text.isEmpty) {
      throw Exception("No voice detected");
    }

    final json = await geminiService.parseTask(text);

    return VoiceTaskModel.fromJson(json);
  }

  @override
Future<void> insertTask(VoiceTaskModel task) async {
  final authUser = _supabase.auth.currentUser;
  if (authUser == null) {
    throw Exception("User not logged in");
  }

  final sender = await _supabase
      .from('users')
      .select('id, name')
      .eq('user_id', authUser.id)
      .maybeSingle();

  final senderId = sender?['id'];
  final senderName = sender?['name'] ?? authUser.email ?? 'User';

  final receiver = await _supabase
      .from('users')
      .select('user_id, name')
      .ilike('name', task.assignedTo)
      .maybeSingle();

  final assigneeAuthId = receiver?['user_id'];
  final assigneeName = receiver?['name'] ?? 'Unassigned';

  await _supabase.from('task').insert({
    'user_id': senderId,
    'assigned_by_id': senderId,
    'assignee_id': assigneeAuthId,
    'assigned_by': senderName,
    'assignee': assigneeName,
    'name': task.title,
    'description': task.description,
    'due_date': task.deadline.toIso8601String().split('T').first,
    'status': mapStatus(task.status),
  });
}

  @override
  Future<void> startRecord() async {
    await voiceService.startRecord();
  }
}
