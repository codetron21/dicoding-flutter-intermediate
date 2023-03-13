import 'package:dicoding_story_app/features/story/detail/state/detail_story_state.dart';
import 'package:dicoding_story_app/features/story/services/stories_services.dart';
import 'package:dicoding_story_app/main/main_notifier.dart';
import 'package:dicoding_story_app/main/main_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailStoryNotifier extends StateNotifier<DetailStoryState> {
  static final provider =
  StateNotifierProvider.autoDispose<DetailStoryNotifier, DetailStoryState>(
        (ref) {
      final service = ref.read(StoriesServices.provider);
      final main = ref.read(MainNotifier.provider);
      return DetailStoryNotifier(service, main);
    },
  );

  final StoriesServices _services;
  final MainState _mainState;

  DetailStoryNotifier(this._services, this._mainState)
      : super(const DetailStoryState()) {
    getStory();
  }

  void getStory() async {
    state = state.copyWith(isLoading: true);
    final token = _mainState.userToken;

    if (token == null) {
      state = DetailStoryState.makeError('Unauthorized.');
      return;
    }

    final storyId = _mainState.storyId;
    if (storyId == null) {
      state = DetailStoryState.makeError('No story id.');
      return;
    }

    final result = await _services.getStory(token, storyId);

    state = state.copyWith(model: result, isLoading: false);
  }
}
