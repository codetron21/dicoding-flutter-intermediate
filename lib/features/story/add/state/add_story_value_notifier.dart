import 'dart:async';

import 'package:camera/camera.dart';
import 'package:dicoding_story_app/features/story/add/state/add_story_value_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddStoryValueNotifier extends StateNotifier<AddStoryValueState> {
  static final provider = StateNotifierProvider.autoDispose<
      AddStoryValueNotifier,
      AddStoryValueState>((ref) => AddStoryValueNotifier());

  Completer<XFile?>? _completer;

  AddStoryValueNotifier() : super(const AddStoryValueState());

  void setImageFile(XFile? imageFile) {
    state = state.copyWith(imageFile: imageFile);

    if (imageFile == null) {
      state = state.copyWith(messageImageError: "Please add a photo");
      return;
    }

    state = state.copyWith(messageImageError: "");
  }

  Future<XFile?> waitForResult() async {
    _completer = Completer<XFile?>();
    return _completer?.future;
  }

  void returnData(XFile? value) {
    _completer?.complete(value);
  }

  void onDescriptionOnChanged(String value) {
    state = state.copyWith(description: value);

    if (value.isEmpty) {
      state = state.copyWith(messageDescError: "Description can't be empty.");
      return;
    }

    state = state.copyWith(messageDescError: "");
  }

  bool onButtonAddPressed() {
    final file = state.imageFile;
    final description = state.description;

    if (file == null || description.isEmpty) {
      onDescriptionOnChanged(description);
      setImageFile(file);
      return false;
    }

    return true;
  }
}
