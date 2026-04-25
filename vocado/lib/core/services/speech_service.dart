import 'dart:core';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:vocado/core/network/api_endpoints.dart';
import 'package:vocado/core/network/dio_client.dart';

@lazySingleton
class SpeechService {
  final DioClient dioClient;

  SpeechService(this.dioClient);

  Future<String> uploadAudio(String filePath) async {
    final formData = FormData.fromMap({
      'audio': await MultipartFile.fromFile(filePath),
    });

    final response = await dioClient.post(ApiEndpoints.upload, data: formData);

    return response.data['audio_url'];
  }

  Future<String> startTranscription(String audioUrl) async {
    final response = await dioClient.post(
      ApiEndpoints.transcription,
      data: {"audio_url": audioUrl},
    );

    return response.data['id'];
  }

  Future<String> getResult(String id) async {
    final response =
        await dioClient.get('${ApiEndpoints.transcription}/$id');

    return response.data['result']?['transcription']?['full_transcript'] ?? '';
  }

  Future<String> processAudio(String filePath) async {
    final audioUrl = await uploadAudio(filePath);
    print("Uploaded: $audioUrl");

    final id = await startTranscription(audioUrl);
    print("ID: $id");

    for (int i = 0; i < 15; i++) {
      await Future.delayed(const Duration(seconds: 2));

      final response =
          await dioClient.get('${ApiEndpoints.transcription}/$id');

      print("Polling: ${response.data}");

      final status = response.data['status'];

      if (status == 'Completed') {
        final text =
            response.data['result']?['transcription']?['full_transcript'] ?? '';

        print("FINAL TEXT: $text");
        return text;
      }
    }

    return "";
  }
}