import 'package:camera/camera.dart';

class AddStoryValueState {
  final XFile? imageFile;
  final String description;

  const AddStoryValueState({
    this.imageFile,
    this.description = "",
  });

  factory AddStoryValueState.init() {
    return const AddStoryValueState();
  }

  String? get imagePath => imageFile?.path;

  bool get imagePathExists => imagePath != null;

  AddStoryValueState copy({
    XFile? imageFile,
    String? description,
  }) {
    return AddStoryValueState(
      imageFile: imageFile ?? this.imageFile,
      description: description ?? this.description,
    );
  }
}
