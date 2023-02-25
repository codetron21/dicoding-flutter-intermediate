import 'package:dicoding_story_app/main_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainProvider extends StateNotifier<MainState> {
  static final provider =
      StateNotifierProvider<MainProvider, MainState>((ref) => MainProvider());

  MainProvider() : super(MainState.init());

  void navigateToRegister() {
    state = MainState.register();
  }

  void onPop() {
    if (state.isRegister) {
      state = MainState.init();
    }
  }
}
