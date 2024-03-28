import 'dart:convert';
import 'package:http/http.dart' as http;

class ImageGenerationService {
  static const String _apiKey =
      'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyX2lkIjoiYTAyZmM2OWEtYjlmMS00YjI2LWEyYjUtMjYxMGY4NDI4NDAzIiwidHlwZSI6ImFwaV90b2tlbiJ9.5CR1u4SCGKBdMNa-e4z8TyIad0rz06WQnTMCUuiGCI8'; // FIXME: Replace with your API key
  static const String _url = 'https://api.edenai.run/v2/image/generation';

  // TODO: Complete the code
  Future<Map<String, dynamic>> generateImage(String prompt) async {
    final response = await http.post(
      Uri.parse(_url),
      headers: {
        'Authorization': _apiKey,
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'providers': 'replicate',
        'text': prompt,
        'resolution': '512x512',
      }),
    );

    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');

    if (response.statusCode == 200) {
      Map<String, dynamic> responseData = jsonDecode(response.body);
      return responseData;
    } else {
      throw Exception('Failed to generate image: ${response.body}');
    }
  }

}