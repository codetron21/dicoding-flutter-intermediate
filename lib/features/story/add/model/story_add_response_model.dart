import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_add_response_model.g.dart';

@JsonSerializable()
class StoryAddResponseModel {
  @JsonKey(name: 'error')
  final bool error;
  @JsonKey(name: 'message')
  final String message;

  const StoryAddResponseModel({
    required this.error,
    required this.message,
  });

  factory StoryAddResponseModel.fromJson(Map<String,dynamic> json)=>_$StoryAddResponseModelFromJson(json);

}
