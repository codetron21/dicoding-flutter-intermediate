import 'package:dicoding_story_app/features/story/list/state/list_story_state.dart';
import 'package:dicoding_story_app/features/story/services/stories_services.dart';
import 'package:dicoding_story_app/main_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListStoryNotifier extends StateNotifier<ListStoryState> {
  static final provider =
      StateNotifierProvider.autoDispose<ListStoryNotifier, ListStoryState>(
    (ref) {
      final service = ref.read(StoriesServices.provider);
      final mainNotifier = ref.read(MainNotifier.provider.notifier);
      return ListStoryNotifier(service, mainNotifier);
    },
  );

  final StoriesServices _services;
  final MainNotifier _mainNotifier;

  ListStoryNotifier(
    this._services,
    this._mainNotifier,
  ) : super(ListStoryState.init());

  void getAll(String token) async {
    state = state.makeLoading(true);

    final result = await _services.getAll(token);

    state = state.getResult(result);
  }

  void onAddClicked() {
    _mainNotifier.navigateToAdd();
  }

  void onItemClicked(String storyId) {
    _mainNotifier.navigateToDetail(storyId);
  }

  void onLogoutMenuClicked() {
    _mainNotifier.navigateToOptionsDialog(
      'Are you sure you want to logout?',
      true,
    );
  }
}
