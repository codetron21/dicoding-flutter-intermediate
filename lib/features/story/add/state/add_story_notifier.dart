import 'package:camera/camera.dart';
import 'package:dicoding_story_app/features/story/add/state/add_story_state.dart';
import 'package:dicoding_story_app/features/story/services/stories_services.dart';
import 'package:dicoding_story_app/main_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddStoryNotifier extends StateNotifier<AddStoryState> {
  static final provider =
      StateNotifierProvider<AddStoryNotifier, AddStoryState>(
    (ref) {
      final services = ref.read(StoriesServices.provider);
      final mainNotifier = ref.read(MainNotifier.provider.notifier);
      return AddStoryNotifier(services, mainNotifier);
    },
  );

  final StoriesServices _services;
  final MainNotifier _mainNotifier;

  AddStoryNotifier(
    this._services,
    this._mainNotifier,
  ) : super(AddStoryState.init());

  void navigateToCamera(List<CameraDescription> cameras) {
    _mainNotifier.navigateToCamera(cameras);
  }

  void addStory(String token, XFile file, String description) async {
    final fileName = file.name;
    final bytes = await file.readAsBytes();

    state = state.makeLoading(true);

    try {
      final result =
          await _services.addStory(token, bytes, fileName, description);
      state = state.getResult(result);
      _mainNotifier.navigateToDialog(message: state.message);
    } catch (err) {
      state = state.makeError("$err");
    }
  }
}
