// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_get_all_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_StoryGetAllResponseModel _$$_StoryGetAllResponseModelFromJson(
        Map<String, dynamic> json) =>
    _$_StoryGetAllResponseModel(
      error: json['error'] as bool?,
      message: json['message'] as String?,
      listStory: (json['listStory'] as List<dynamic>?)
          ?.map((e) => StoryResponseModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_StoryGetAllResponseModelToJson(
        _$_StoryGetAllResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
      'listStory': instance.listStory,
    };
