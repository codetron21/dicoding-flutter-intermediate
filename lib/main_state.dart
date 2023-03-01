import 'package:camera/camera.dart';

class MainState {
  final String? userToken;
  final String? storyId;
  final List<CameraDescription>? cameras;
  final bool isRegister;
  final bool isAddStory;

  const MainState({
    this.userToken,
    this.storyId,
    this.cameras,
    required this.isRegister,
    required this.isAddStory,
  });

  factory MainState.init()
  {
    return const MainState(
        userToken: null,
        storyId: null,
        cameras: null,
        isRegister: false,
        isAddStory: false,);
  }

  MainState copy({
    String? userToken,
    String? storyId,
    List<CameraDescription>? cameras,
    bool? isRegister,
    bool? isAddStory,
  }) {
    return MainState(
      userToken: userToken ?? this.userToken,
      storyId: storyId ?? this.storyId,
      cameras: cameras ?? this.cameras,
      isRegister: isRegister ?? this.isRegister,
      isAddStory: isAddStory ?? this.isAddStory,
    );
  }

  MainState resetMain() {
    return MainState(
      userToken: userToken,
      storyId: null,
      cameras: null,
      isRegister: false,
      isAddStory: false,
    );
  }

  MainState resetCamera() {
    return MainState(
      userToken: userToken,
      storyId: null,
      cameras: null,
      isRegister: false,
      isAddStory: true,
    );
  }

  bool get isUserLoggedIn => userToken != null;

  bool get storyIdExists => storyId != null;

  bool get cameraExists => cameras != null;
}
