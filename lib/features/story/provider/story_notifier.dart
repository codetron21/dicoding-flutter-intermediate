import 'dart:async';

import 'package:camera/camera.dart';
import 'package:dicoding_story_app/features/story/provider/story_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StoryNotifier extends StateNotifier<StoryState> {
  static final provider =
      StateNotifierProvider.autoDispose((ref) => StoryNotifier());

  Completer<bool> _completer = Completer();

  StoryNotifier() : super(const StoryState());

  void navigateToDetail(String? storyId) {
    if (storyId == null) return;
    state = state.copy(storyId: storyId);
  }

  void navigateToAdd() {
    state = state.copy(isAddStory: true);
  }

  void navigateToCamera(List<CameraDescription> cameras) {
    state = state.copy(cameras: cameras);
  }

  Future<bool> waitForResult() async {
    _completer = Completer<bool>();
    return _completer.future;
  }

  void returnData(bool value) {
    _completer.complete(value);
  }

  void onPop() {
    if (state.cameras != null) {
      state = state.resetCamera();
      return;
    }

    state = const StoryState();
  }
}
