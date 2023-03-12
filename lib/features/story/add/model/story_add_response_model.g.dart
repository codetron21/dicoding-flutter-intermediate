// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_add_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryAddResponseModel _$StoryAddResponseModelFromJson(
        Map<String, dynamic> json) =>
    StoryAddResponseModel(
      error: json['error'] as bool,
      message: json['message'] as String,
    );

Map<String, dynamic> _$StoryAddResponseModelToJson(
        StoryAddResponseModel instance) =>
    <String, dynamic>{
      'error': instance.error,
      'message': instance.message,
    };
