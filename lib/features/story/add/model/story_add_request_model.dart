import 'package:freezed_annotation/freezed_annotation.dart';

part 'story_add_request_model.g.dart';

@JsonSerializable()
class StoryAddRequestModel {
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'photo')
  final String photo;

  const StoryAddRequestModel({
    required this.description,
    required this.photo,
  });

  Map<String, dynamic> toJson() => _$StoryAddRequestModelToJson(this);
}
