import 'package:dicoding_story_app/features/story/model/story_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_detail_response_model.g.dart';

@JsonSerializable()
class StoryDetailResponseModel {
  @JsonKey(name: 'error')
  final bool error;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'story')
  final StoryResponseModel? story;

  StoryDetailResponseModel({
    required this.error,
    required this.message,
    required this.story,
  });

  factory StoryDetailResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoryDetailResponseModelFromJson(json);
}
