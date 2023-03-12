import 'package:camera/camera.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_story_value_state.freezed.dart';

@freezed
@immutable
class AddStoryValueState with _$AddStoryValueState{

  const AddStoryValueState._();

  const factory AddStoryValueState({
    XFile? imageFile,
    @Default('') String description,
    @Default('') String messageDescError,
    @Default('') String messageImageError,
  }) = _AddStoryValueState;

  String? get imagePath => imageFile?.path;

  bool get imagePathExists => imagePath != null;

  bool get isDescError => messageDescError.isNotEmpty;

  bool get isImageError => messageImageError.isNotEmpty;

  bool get hasErrors => imageFile == null || description.isEmpty;

}
