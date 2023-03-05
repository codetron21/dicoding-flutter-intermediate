import 'package:camera/camera.dart';

class MainState {
  final AuthState authState;
  final StoryState storyState;

  const MainState({
    required this.authState,
    required this.storyState
});

  bool get isUserLoggedIn => userToken != null;

  bool get storyIdExists => storyId != null;

  bool get cameraExists => cameras != null;
}
