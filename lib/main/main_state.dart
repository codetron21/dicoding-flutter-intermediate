import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'main_state.freezed.dart';

@freezed
@immutable
class MainState with _$MainState {
  const MainState._();

  const factory MainState({
    String? userToken,
    String? storyId,
    String? message,
    List<CameraDescription>? cameras,
    @Default(false) bool commandLogout,
    @Default(false) bool isUserLoggedIn,
    @Default(false) bool isShowDialog,
    @Default(false) bool isShowConfirmDialog,
    @Default(false) bool isRegister,
    @Default(false) bool isAddStory,
  }) = _MainState;

  bool get storyIdExists => storyId != null;

  bool get cameraExists => cameras != null;
}
