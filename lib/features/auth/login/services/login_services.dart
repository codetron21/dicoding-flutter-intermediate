import 'dart:convert';

import 'package:dicoding_story_app/features/auth/login/model/login_request_model.dart';
import 'package:dicoding_story_app/features/auth/login/model/login_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

class LoginServices {
  static final provider = Provider((ref) => LoginServices.instance);
  static final LoginServices instance = LoginServices._();

  final _baseUrl = "https://story-api.dicoding.dev/v1/login";

  LoginServices._();

  Future<LoginResponseModel> login(LoginRequestModel model) async {
    final url = Uri.parse(_baseUrl);
    final body = jsonEncode(model.toJson());
    final headers = {'Content-Type': 'application/json'};

    final response = await http.post(
      url,
      headers: headers,
      body: body,
    );

    if (response.statusCode != 200) {
      return LoginResponseModel(
        error: true,
        message: response.reasonPhrase ?? '',
      );
    }

    return LoginResponseModel.fromJson(jsonDecode(response.body));
  }
}
