import 'package:dicoding_story_app/features/story/detail/model/story_detail_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detail_story_state.freezed.dart';

@freezed
@immutable
class DetailStoryState with _$DetailStoryState {
  const DetailStoryState._();

  const factory DetailStoryState({
    @Default(false) bool isLoading,
    StoryDetailResponseModel? model,
  }) = _DetailStoryState;

  String get message => model?.message ?? "";

  bool get isError => model?.error ?? false;

  bool get isSuccess => !(model?.error ?? true);
}
