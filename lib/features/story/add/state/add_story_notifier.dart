import 'package:camera/camera.dart';
import 'package:dicoding_story_app/features/story/add/state/add_story_state.dart';
import 'package:dicoding_story_app/features/story/services/stories_services.dart';
import 'package:dicoding_story_app/main/main_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddStoryNotifier extends StateNotifier<AddStoryState> {
  static final provider =
      StateNotifierProvider<AddStoryNotifier, AddStoryState>(
    (ref) {
      final services = ref.read(StoriesServices.provider);
      final mainNotifier = ref.read(MainNotifier.provider.notifier);
      final token = ref.read(MainNotifier.provider).userToken;
      return AddStoryNotifier(services, mainNotifier, token);
    },
  );

  final StoriesServices _services;
  final MainNotifier _mainNotifier;
  final String? _token;

  AddStoryNotifier(
    this._services,
    this._mainNotifier,
    this._token,
  ) : super(const AddStoryState());

  void navigateToCamera(List<CameraDescription> cameras) {
    _mainNotifier.navigateToCamera(cameras);
  }

  void addStory(XFile? file, String? description) async {
    if (file == null || description == null) {
      _mainNotifier.navigateToDialog(message: 'Please fill all form.');
      return;
    }

    final token = _token;
    if (token == null) {
      _mainNotifier.navigateToDialog(message: 'Unauthorized');
      return;
    }

    try {
      final fileName = file.name;
      final bytes = await file.readAsBytes();

      state = state.copyWith(isLoading: true);

      final result =
          await _services.addStory(token, bytes, fileName, description);
      state = state.copyWith(isLoading: false, model: result);
      _mainNotifier.navigateToDialog(message: state.message);
    } catch (err) {
      state = AddStoryState.makeError("$err");
    }
  }
}
