import 'dart:convert';

import 'package:dicoding_story_app/features/story/model/story_response_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;

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

  Future<StoryDetailResponseModel> getStory(String token,
      String storyId) async {
    final endPoints = "$_baseUrl/stories/$storyId";
    final url = Uri.parse(endPoints);
    final headers = {"Authorization": "Bearer $token"};
    final response = await http.get(url, headers: headers);

    return StoryDetailResponseModel.fromJson(jsonDecode(response.body));
  }

  // Future<> addStory(String token) {
  //   final endPoints = "$_baseUrl/stories";
  //   final url = Uri.parse(endPoints);
  //   final headers = {"Authorization": "Bearer $token", "Content-Type": "multipart/form-data",};
  // }

}
