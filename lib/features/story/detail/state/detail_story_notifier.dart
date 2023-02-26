import 'package:dicoding_story_app/features/story/detail/state/detail_story_state.dart';
import 'package:dicoding_story_app/features/story/services/stories_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailStoryNotifier extends StateNotifier<DetailStoryState> {
  static final provider = StateNotifierProvider<DetailStoryNotifier, DetailStoryState>(
      (ref) => DetailStoryNotifier(ref.read(StoriesServices.provider)));

  final StoriesServices _services;

  DetailStoryNotifier(this._services) : super(DetailStoryState.init());

  void getStory(String token, String storyId) async {
    state = state.makeLoading(true);

    final result = await _services.getStory(token, storyId);

    state = state.getResult(result);
  }
}
