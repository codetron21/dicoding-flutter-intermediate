import 'package:dicoding_story_app/features/story/list/model/story_get_all_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'list_story_state.freezed.dart';

@freezed
@immutable
class ListStoryState with _$ListStoryState {
  const ListStoryState._();

  const factory ListStoryState({
    @Default(false) bool isLoading,
    StoryGetAllResponseModel? model,
  }) = _ListStoryState;

  String get message => model?.message ?? "";

  bool get isError => model?.error ?? false;
}
