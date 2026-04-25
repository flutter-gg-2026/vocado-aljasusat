import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GeminiService {
  final Dio dio;

  GeminiService(this.dio);

  Future<Map<String, dynamic>> parseTask(String text) async {
    final apiKey = dotenv.env['GEMINI_API_KEY'];
    final today = DateTime.now().toIso8601String();
    final url =
        "https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash:generateContent?key=$apiKey";

    final response = await dio.post(
      url,
      data: {
        "contents": [
          {
            "parts": [
              {
                "text":
                    """
                  Today is: $today
Extract task details from this sentence.

The sentence may be in Arabic or English.

IMPORTANT:
- Detect Arabic names like (رشا، محمد، أحمد) and convert them properly.
- assigned_to MUST NOT be null. If missing, return "Unknown".
- assigned_by MUST NOT be null. If missing, return "Me".
- Use today's date to calculate relative dates like "غدا" or "tomorrow".
- status MUST be exactly: inProgress.

Return JSON only:

- title
- description
- assigned_to
- assigned_by
- deadline (ISO format)
- status

Sentence:
$text
""",
              },
            ],
          },
        ],
      },
    );

    final raw = response.data['candidates'][0]['content']['parts'][0]['text'];

    final cleaned = raw.replaceAll('```json', '').replaceAll('```', '').trim();

    final start = cleaned.indexOf('{');
    final end = cleaned.lastIndexOf('}');

    return jsonDecode(cleaned.substring(start, end + 1));
  }
}
