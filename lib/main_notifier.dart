import 'package:dicoding_story_app/common/preferences.dart';
import 'package:dicoding_story_app/main_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNotifier extends StateNotifier<MainState> {
  static final provider = StateNotifierProvider<MainNotifier, MainState>(
      (ref) => MainNotifier(ref.read(LoginPreferences.provider)));

  final LoginPreferences _preferences;

  MainNotifier(this._preferences) : super(MainState.init()) {
    _init();
  }

  void _init() async {
    String? token = await _preferences.getToken();
    if (token == null) return;
    state = state.copy(userToken: token);
  }

  void navigateToRegister() {
    state = state.copy(isRegister: true);
  }

  void navigateToMain(String? token) async {
    if (token == null) return;
    final result = await _preferences.addToken(token);
    if (!result) return;
    state = state.copy(userToken: token);
  }

  void navigateToAuth() async {
    final result = await _preferences.removeToken();
    if (!result) return;
    state = MainState.init();
  }

  void navigateToDetail(String? storyId) {
    if (storyId == null) return;
    state = state.copy(storyId: storyId);
  }

  void navigateToAdd() {
    state = state.copy(isAddStory: true);
  }

  void onPop() {
    if (state.isRegister) {
      state = state.copy(isRegister: false);
      return;
    }

    if (state.isAddStory) {
      state = state.resetMain();
      return;
    }

    if (state.storyId != null) {
      state = state.resetMain();
      return;
    }
  }
}
