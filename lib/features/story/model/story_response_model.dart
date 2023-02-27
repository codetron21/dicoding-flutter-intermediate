import 'package:intl/intl.dart';

class StoryAddResponseModel {
  final bool error;
  final String message;

  const StoryAddResponseModel({
    required this.error,
    required this.message,
  });

  factory StoryAddResponseModel.fromJson(Map<String, dynamic> json) {
    return StoryAddResponseModel(
      error: json['error'],
      message: json['message'],
    );
  }
}

class StoryGetAllResponseModel {
  final bool error;
  final String message;
  final List<Story> listStory;

  const StoryGetAllResponseModel({
    required this.error,
    required this.message,
    required this.listStory,
  });

  factory StoryGetAllResponseModel.fromJson(Map<String, dynamic> json) {
    List<Story> stories =
        (json['listStory'] as List).map((e) => Story.fromJson(e)).toList();

    return StoryGetAllResponseModel(
      error: json['error'],
      message: json['message'],
      listStory: stories,
    );
  }
}

class StoryDetailResponseModel {
  final bool error;
  final String message;
  final Story story;

  StoryDetailResponseModel({
    required this.error,
    required this.message,
    required this.story,
  });

  factory StoryDetailResponseModel.fromJson(Map<String, dynamic> json) {
    return StoryDetailResponseModel(
      error: json['error'],
      message: json['message'],
      story: Story.fromJson(json['story']),
    );
  }
}

class Story {
  final String id;
  final String name;
  final String description;
  final String photoUrl;
  final String createdAt;

  const Story({
    required this.id,
    required this.name,
    required this.description,
    required this.photoUrl,
    required this.createdAt,
  });

  factory Story.fromJson(Map<String, dynamic> json) {
    String createdAt = json['createdAt'];
    DateTime dateTime = DateTime.parse(createdAt);
    String date = DateFormat('dd-MM-yyyy kk:mm').format(dateTime);

    return Story(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      photoUrl: json['photoUrl'],
      createdAt: date,
    );
  }
}
