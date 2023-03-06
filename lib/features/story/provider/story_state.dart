import 'package:camera/camera.dart';

class StoryState {
  final String? storyId;
  final String? message;
  final List<CameraDescription>? cameras;
  final bool isAddStory;
  final bool isShowConfirmDialog;
  final bool isShowOptionsDialog;

  const StoryState({
    this.storyId,
    this.cameras,
    this.message,
    this.isShowConfirmDialog = false,
    this.isShowOptionsDialog = false,
    this.isAddStory = false,
  });

  StoryState copy({
    String? storyId,
    String? message,
    List<CameraDescription>? cameras,
    bool? isAddStory,
    bool isShowConfirmDialog = false,
    bool isShowOptionsDialog = false,
  }) {
    return StoryState(
      storyId: storyId ?? this.storyId,
      message: message,
      cameras: cameras ?? this.cameras,
      isAddStory: isAddStory ?? this.isAddStory,
      isShowConfirmDialog: isShowConfirmDialog,
      isShowOptionsDialog: isShowOptionsDialog,
    );
  }

  StoryState resetCamera() {
    return const StoryState(isAddStory: true);
  }

  bool get storyIdExists => storyId != null;

  bool get cameraExists => cameras != null;
}
