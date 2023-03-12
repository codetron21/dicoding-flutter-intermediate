import 'package:dicoding_story_app/features/story/model/story_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_get_all_response_model.g.dart';

@JsonSerializable()
class StoryGetAllResponseModel {
  @JsonKey(name: 'error')
  final bool error;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'listStory')
  final List<StoryResponseModel> listStory;

  const StoryGetAllResponseModel({
    required this.error,
    required this.message,
    required this.listStory,
  });

  factory StoryGetAllResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoryGetAllResponseModelFromJson(json);
}
