import 'package:dicoding_story_app/features/story/model/story_response_model.dart';

class AddStoryState {
  final bool isLoading;
  final StoryAddResponseModel? response;

  const AddStoryState({
    required this.isLoading,
    this.response,
  });

  factory AddStoryState.init() {
    return const AddStoryState(isLoading: false);
  }

  bool get isError => response?.error ?? false;

  bool get isSuccess => !(response?.error ?? true);

  String get message => response?.message ?? "";

  AddStoryState copy({
    bool? isLoading,
    StoryAddResponseModel? response,
  }) {
    return AddStoryState(
      isLoading: isLoading ?? this.isLoading,
      response: response ?? this.response,
    );
  }

  AddStoryState makeLoading(bool loading) {
    return AddStoryState(
      isLoading: loading,
      response: null,
    );
  }

  AddStoryState getResult(StoryAddResponseModel response) {
    return AddStoryState(
      isLoading: false,
      response: response,
    );
  }

  AddStoryState makeError(String message) {
    return AddStoryState(
      isLoading: false,
      response: StoryAddResponseModel(
        error: true,
        message: message,
      ),
    );
  }
}
