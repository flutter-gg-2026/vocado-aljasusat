import 'package:injectable/injectable.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:vocado/core/services/gemini_service.dart';
import 'package:vocado/core/services/local_keys_service.dart';
import 'package:vocado/core/services/speech_service.dart';
import 'package:vocado/core/services/voice_service.dart';
import 'package:vocado/features/voice_task/data/models/voice_task_model.dart';
import 'package:vocado/core/errors/network_exceptions.dart';

abstract class BaseVoiceTaskRemoteDataSource {
  Future<VoiceTaskModel> getVoiceTask();
  Future<void> startRecord();
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

  @override
  Future<VoiceTaskModel> getVoiceTask() async {
    final path = await voiceService.stopRecord();

    if (path == null) {
      throw Exception("No audio recorded");
    }

    final text = await speechService.processAudio(path);

    print(" TRANSCRIBED TEXT: $text");
    if (text.isEmpty) {
      return VoiceTaskModel(
        title: "No voice detected",
        description: "Try speaking clearly",
        assignedTo: "",
        assignedBy: "",
        deadline: DateTime.now(),
        status: "failed",
      );
    }

    final json = await geminiService.parseTask(text);

    print(" TRANSCRIBED json: $json");
    return VoiceTaskModel.fromJson(json);
  }

  @override
  Future<void> startRecord() async {
    await voiceService.startRecord();
  }
}
