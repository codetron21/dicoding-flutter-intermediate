import 'package:camera/camera.dart';
import 'package:dicoding_story_app/features/story/add/state/add_story_state.dart';
import 'package:dicoding_story_app/features/story/services/stories_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddStoryNotifier extends StateNotifier<AddStoryState> {
  static final provider =
      StateNotifierProvider<AddStoryNotifier, AddStoryState>(
    (ref) {
      final services = ref.read(StoriesServices.provider);
      return AddStoryNotifier(services);
    },
  );

  final StoriesServices _services;

  AddStoryNotifier(
    this._services,
  ) : super(AddStoryState.init());

  void addStory(String token, XFile file, String description) async {
    final fileName = file.name;
    final bytes = await file.readAsBytes();

    state = state.makeLoading(true);

    try {
      final result =
          await _services.addStory(token, bytes, fileName, description);
      state = state.getResult(result);
    } catch (err) {
      state = state.makeError("$err");
    }
  }
}
