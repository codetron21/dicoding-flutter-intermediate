import 'package:dicoding_story_app/features/story/model/story_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_get_all_response_model.g.dart';
part 'story_get_all_response_model.freezed.dart';

@freezed
@immutable
class StoryGetAllResponseModel with _$StoryGetAllResponseModel{

  const StoryGetAllResponseModel._();

  const factory StoryGetAllResponseModel({
    @JsonKey(name: 'error') bool? error,
    @JsonKey(name: 'message') String? message,
    @JsonKey(name: 'listStory') List<StoryResponseModel>? listStory,
  }) = _StoryGetAllResponseModel;

  factory StoryGetAllResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoryGetAllResponseModelFromJson(json);
}
