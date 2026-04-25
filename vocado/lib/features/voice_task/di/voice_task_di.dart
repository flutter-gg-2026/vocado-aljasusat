import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'voice_task_di.config.dart'; 

@InjectableInit(
  initializerName: 'initVoiceTask',
   // Optional: specify the directory to scan for injectable annotations
  generateForDir: ['lib/features/voice_task'],
)
void configureVoiceTask(GetIt getIt) {
  getIt.initVoiceTask();
}