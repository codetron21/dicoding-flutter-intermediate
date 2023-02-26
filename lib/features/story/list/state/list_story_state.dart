import 'package:dicoding_story_app/features/story/model/story_response_model.dart';

class ListStoryState {
  final bool isLoading;
  final StoryGetAllResponseModel? model;
  final bool showLogoutDialog;

  const ListStoryState({
    required this.isLoading,
    this.model,
    this.showLogoutDialog = false,
  });

  factory ListStoryState.init() {
    return const ListStoryState(isLoading: false);
  }

  String get message => model?.message ?? "";

  bool get isError => model?.error ?? false;

  bool get isSuccess => !(model?.error ?? true);

  ListStoryState makeLoading(bool loading) {
    return ListStoryState(
      isLoading: loading,
      model: null,
    );
  }

  ListStoryState copy({
    bool? isLoading,
    StoryGetAllResponseModel? model,
    bool? showLogoutDialog,
  }) {
    return ListStoryState(
      isLoading: isLoading ?? this.isLoading,
      model: model ?? this.model,
      showLogoutDialog: showLogoutDialog ?? this.showLogoutDialog,
    );
  }

  ListStoryState getResult(StoryGetAllResponseModel model) {
    return ListStoryState(
      isLoading: false,
      model: model,
    );
  }
}
