import 'package:dicoding_story_app/common/preferences.dart';
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
      final pref = ref.read(LoginPreferences.provider);
      return ListStoryNotifier(service, mainNotifier, pref);
    },
  );

  final StoriesServices _services;
  final MainNotifier _mainNotifier;
  final LoginPreferences _preferences;

  ListStoryNotifier(
    this._services,
    this._mainNotifier,
    this._preferences,
  ) : super(ListStoryState.init());

  void getAll() async {
    String? token = await _preferences.getToken();
    if (token == null) return;
    state = state.makeLoading(true);
    final result = await _services.getAll(token);
    state = state.getResult(result);
  }

  void onAddClicked() {
    _mainNotifier.navigateToAdd();
    _mainNotifier.waitForResult().then((value) {
      final token = _mainNotifier.state.userToken;
      if (token == null) return;
      getAll();
    });
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
