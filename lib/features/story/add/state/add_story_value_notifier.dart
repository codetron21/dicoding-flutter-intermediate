import 'dart:async';

import 'package:camera/camera.dart';
import 'package:dicoding_story_app/features/story/add/state/add_story_value_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddStoryValueNotifier extends StateNotifier<AddStoryValueState> {
  static final provider =
      StateNotifierProvider.autoDispose<AddStoryValueNotifier, AddStoryValueState>((ref) => AddStoryValueNotifier());

  Completer<XFile?>? _completer;

  AddStoryValueNotifier() : super(AddStoryValueState.init());

  void setImageFile(XFile imageFile) {
    state = state.copy(
      imageFile: imageFile,
    );
  }

  Future<XFile?> waitForResult() async {
    _completer = Completer<XFile?>();
    return _completer?.future;
  }

  void returnData(XFile? value) {
    _completer?.complete(value);
  }

  void onDescriptionOnChanged(String value) {
    state = state.copy(description: value);
  }

}
