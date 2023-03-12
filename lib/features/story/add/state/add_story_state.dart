import 'package:dicoding_story_app/features/story/add/model/story_add_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_state.freezed.dart';

@freezed
@immutable
class AddStoryState with _$AddStoryState{
  const AddStoryState._();

  const factory AddStoryState({
    @Default(false) bool isLoading,
    StoryAddResponseModel? model,
  }) = _AddStoryState;

  bool get isError => model?.error ?? false;

  String get message => model?.message ?? "";

  factory AddStoryState.makeError(String message) {
    return AddStoryState(
      isLoading: false,
      model: StoryAddResponseModel(
        error: true,
        message: message,
      ),
    );
  }
}
