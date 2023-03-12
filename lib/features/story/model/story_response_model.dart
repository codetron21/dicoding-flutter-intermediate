import 'dart:developer';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';

part 'story_response_model.g.dart';

@JsonSerializable()
class StoryResponseModel {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String description;
  @JsonKey(name: 'photoUrl')
  final String photoUrl;
  @JsonKey(name: 'createdAt',fromJson: _dateFromJson)
  final String createdAt;

  const StoryResponseModel({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
  });

  factory StoryResponseModel.fromJson(Map<String, dynamic> json) =>
      _$StoryResponseModelFromJson(json);

  static String _dateFromJson(String date){
    DateTime dateTime = DateTime.parse(date);
    return DateFormat('dd-MM-yyyy kk:mm').format(dateTime);
  }

}
