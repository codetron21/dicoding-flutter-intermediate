import 'package:dicoding_story_app/features/auth/register/model/register_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_state.freezed.dart';

@freezed
@immutable
class RegisterState with _$RegisterState {
  const RegisterState._();

  const factory RegisterState({
    RegisterResponseModel? model,
    @Default(false) bool isLoading,
  }) = _RegisterState;

  bool get isError => model?.error ?? false;

  String get message => model?.message ?? "";

  factory RegisterState.makeError(String message) {
    return RegisterState(
      isLoading: false,
      model: RegisterResponseModel(
        error: true,
        message: message,
      ),
    );
  }
}
