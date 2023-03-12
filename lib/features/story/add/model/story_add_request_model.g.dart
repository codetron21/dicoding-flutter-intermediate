// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_add_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryAddRequestModel _$StoryAddRequestModelFromJson(
        Map<String, dynamic> json) =>
    StoryAddRequestModel(
      description: json['description'] as String,
      photo: json['photo'] as String,
    );

Map<String, dynamic> _$StoryAddRequestModelToJson(
        StoryAddRequestModel instance) =>
    <String, dynamic>{
      'description': instance.description,
      'photo': instance.photo,
    };
