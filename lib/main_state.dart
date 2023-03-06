import 'package:camera/camera.dart';

class MainState {
  final String? userToken;
  final String? storyId;
  final String? message;
  final bool isRegister;
  final bool isAddStory;
  final bool isShowDialog;
  final bool isShowConfirmDialog;
  final bool isUserLoggedIn;
  final bool commandLogout;
  final List<CameraDescription>? cameras;

  const MainState({
    this.userToken,
    this.storyId,
    this.cameras,
    this.message,
    this.commandLogout = false,
    this.isUserLoggedIn = false,
    this.isShowDialog = false,
    this.isShowConfirmDialog = false,
    this.isRegister = false,
    this.isAddStory = false,
  });

  factory MainState.init() {
    return const MainState();
  }

  MainState copy({
    String? userToken,
    String? storyId,
    String? message,
    bool? isRegister,
    bool? isAddStory,
    bool? isShowDialog,
    bool? isUserLoggedIn,
    bool? isShowConfirmDialog,
    bool commandLogout = false,
    List<CameraDescription>? cameras,
  }) {
    return MainState(
      userToken: userToken ?? this.userToken,
      storyId: storyId ?? this.storyId,
      cameras: cameras ?? this.cameras,
      isRegister: isRegister ?? this.isRegister,
      isAddStory: isAddStory ?? this.isAddStory,
      isShowDialog: isShowDialog ?? this.isShowDialog,
      isUserLoggedIn: isUserLoggedIn ?? this.isUserLoggedIn,
      isShowConfirmDialog: isShowConfirmDialog ?? this.isShowConfirmDialog,
      commandLogout: commandLogout,
      message: message,
    );
  }

  MainState resetMain() {
    return MainState(
      userToken: userToken,
      isAddStory: false,
      isUserLoggedIn: true,
    );
  }

  MainState resetCamera() {
    return MainState(
      userToken: userToken,
      isAddStory: true,
      isUserLoggedIn: true,
    );
  }

  bool get storyIdExists => storyId != null;

  bool get cameraExists => cameras != null;
}
