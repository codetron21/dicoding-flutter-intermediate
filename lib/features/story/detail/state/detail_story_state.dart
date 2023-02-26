import 'package:dicoding_story_app/features/story/model/story_response_model.dart';

class DetailStoryState {
  final bool isLoading;
  final StoryDetailResponseModel? model;

  const DetailStoryState({
    required this.isLoading,
    this.model,
  });

  factory DetailStoryState.init() {
    return const DetailStoryState(isLoading: false);
  }

  String get message => model?.message ?? "";

  bool get isError => model?.error ?? false;

  bool get isSuccess => !(model?.error ?? true);

  DetailStoryState makeLoading(bool loading) {
    return DetailStoryState(
      isLoading: loading,
      model: null,
    );
  }

  DetailStoryState getResult(StoryDetailResponseModel model) {
    return DetailStoryState(
      isLoading: false,
      model: model,
    );
  }

}
