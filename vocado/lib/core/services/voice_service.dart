import 'package:injectable/injectable.dart';
import 'package:record/record.dart';
import 'package:path_provider/path_provider.dart';
import 'package:uuid/v7.dart';
@lazySingleton
class VoiceService {
  final _record = AudioRecorder();

 Future<String> startRecord() async {
  final dir = await getApplicationDocumentsDirectory();
  final name = UuidV7().generate();

  final path = '${dir.path}/$name.m4a';

  await _record.start(
    const RecordConfig(
  encoder: AudioEncoder.aacLc,
  bitRate: 128000,
  sampleRate: 44100,
),
    path: path,
  );

  return path;
}

  Future<String?> stopRecord() async {
    return await _record.stop();
  }
}