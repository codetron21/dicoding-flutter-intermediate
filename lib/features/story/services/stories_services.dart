import 'dart:convert';

import 'package:dicoding_story_app/features/story/model/story_response_model.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class StoriesServices {
  static final provider = Provider((ref) => StoriesServices());

  final String _baseUrl = 'https://story-api.dicoding.dev/v1';

  Future<StoryGetAllResponseModel> getAll(String token) async {
    final endPoints = "$_baseUrl/stories";
    final url = Uri.parse(endPoints);
    final headers = {"Authorization": "Bearer $token"};
    final response = await http.get(url, headers: headers);

    return StoryGetAllResponseModel.fromJson(jsonDecode(response.body));
  }

  Future<StoryDetailResponseModel> getStory(
      String token, String storyId) async {
    final endPoints = "$_baseUrl/stories/$storyId";
    final url = Uri.parse(endPoints);
    final headers = {"Authorization": "Bearer $token"};
    final response = await http.get(url, headers: headers);

    return StoryDetailResponseModel.fromJson(jsonDecode(response.body));
  }

  Future<StoryAddResponseModel> addStory(
    String token,
    List<int> bytes,
    String fileName,
    String description,
  ) async {
    final endPoints = "$_baseUrl/stories";
    final url = Uri.parse(endPoints);
    var request = http.MultipartRequest('POST', url);

    final Map<String, String> fields = {
      "description": description,
    };

    final MultipartFile multiPartFile = http.MultipartFile.fromBytes(
      "photo",
      bytes,
      filename: fileName,
    );

    final Map<String, String> headers = {
      "Authorization": "Bearer $token",
      "Content-type": "multipart/form-data",
    };

    request.fields.addAll(fields);
    request.files.add(multiPartFile);
    request.headers.addAll(headers);

    final http.StreamedResponse streamedResponse = await request.send();
    final Uint8List responseList = await streamedResponse.stream.toBytes();
    final String responseBody = String.fromCharCodes(responseList);

    return StoryAddResponseModel.fromJson(jsonDecode(responseBody));
  }
}
