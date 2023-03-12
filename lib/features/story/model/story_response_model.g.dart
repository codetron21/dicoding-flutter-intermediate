// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'story_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StoryResponseModel _$StoryResponseModelFromJson(Map<String, dynamic> json) =>
    StoryResponseModel(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      photoUrl: json['photoUrl'] as String,
      createdAt: StoryResponseModel._dateFromJson(json['createdAt'] as String),
    );

Map<String, dynamic> _$StoryResponseModelToJson(StoryResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'photoUrl': instance.photoUrl,
      'createdAt': instance.createdAt,
    };
