import 'package:dicoding_story_app/common/preferences.dart';
import 'package:dicoding_story_app/features/story/list/state/list_story_state.dart';
import 'package:dicoding_story_app/features/story/services/stories_services.dart';
import 'package:dicoding_story_app/main/main_notifier.dart';
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
  ) : super(const ListStoryState()) {
    getAll();
  }

  void getAll() async {
    state = state.copyWith(isLoading: true);

    var token = _mainNotifier.state.userToken;

    if (token == null) {
      token = await _preferences.getToken();
      _mainNotifier.setToken(token);
    }

    if (token == null) {
      state = state.copyWith(isLoading: false);
      return;
    }

    final result = await _services.getAll(token);
    state = state.copyWith(model: result, isLoading: false);
  }

  void onAddClicked() async {
    _mainNotifier.navigateToAdd();
    final result = await _mainNotifier.waitForResult();
    if (!result) return;
    getAll();
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
