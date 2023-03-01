import 'package:dicoding_story_app/features/story/list/state/list_story_state.dart';
import 'package:dicoding_story_app/features/story/services/stories_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListStoryNotifier extends StateNotifier<ListStoryState> {
  static final provider =
      StateNotifierProvider.autoDispose<ListStoryNotifier, ListStoryState>(
    (ref) => ListStoryNotifier(ref.read(StoriesServices.provider)),
  );

  final StoriesServices _services;

  ListStoryNotifier(this._services) : super(ListStoryState.init());

  void getAll(String token) async {
    state = state.makeLoading(true);

    final result = await _services.getAll(token);

    state = state.getResult(result);
  }

  void onLogoutMenuClicked() {
    state = state.copy(showLogoutDialog: true);
  }
}
