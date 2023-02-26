import 'package:dicoding_story_app/features/auth/register/model/register_request_model.dart';
import 'package:dicoding_story_app/features/auth/register/model/register_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RegisterServices {
  static final provider = Provider((ref) => RegisterServices());

  final String _baseUrl = 'https://story-api.dicoding.dev/v1/register';

  Future<RegisterResponseModel> register(RegisterRequestModel model) async {
    final url = Uri.parse(_baseUrl);
    final body = jsonEncode(model.toJson());
    final headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    return RegisterResponseModel.fromJson(jsonDecode(response.body));
  }
}
