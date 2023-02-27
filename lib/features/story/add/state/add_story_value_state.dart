import 'package:camera/camera.dart';

class AddStoryValueState {
  final XFile? imageFile;
  final String description;
  final String messageDescError;
  final String messageImageError;

  const AddStoryValueState({
    this.imageFile,
    this.description = "",
    this.messageDescError = "",
    this.messageImageError = "",
  });

  factory AddStoryValueState.init() {
    return const AddStoryValueState();
  }

  AddStoryValueState copy({
    XFile? imageFile,
    String? description,
    String? messageDescError,
    String? messageImageError,
  }) {
    return AddStoryValueState(
      imageFile: imageFile ?? this.imageFile,
      description: description ?? this.description,
      messageDescError: messageDescError ?? this.messageDescError,
      messageImageError: messageImageError ?? this.messageImageError,
    );
  }

  AddStoryValueState removeImageError() {
    return copy(messageImageError: "");
  }

  AddStoryValueState removeDescError() {
    return copy(messageDescError: "");
  }

  String? get imagePath => imageFile?.path;

  bool get imagePathExists => imagePath != null;

  bool get isDescError => messageDescError.isNotEmpty;

  bool get isImageError => messageImageError.isNotEmpty;

  bool get hasErrors => imageFile == null || description.isEmpty;

}
