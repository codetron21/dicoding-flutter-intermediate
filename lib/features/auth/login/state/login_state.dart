import 'package:dicoding_story_app/features/auth/login/model/login_response_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_state.freezed.dart';

@freezed
@immutable
class LoginState with _$LoginState{

  const LoginState._();

  const factory LoginState({
    LoginResponseModel? model,
    @Default(false) bool isLoading,
  }) = _LoginState;

  bool get isError => model?.error ?? false;

  String get message => model?.message ?? "";

  String? get token => model?.result?.token;

  factory LoginState.makeError(String message) {
    return LoginState(
      isLoading: false,
      model: LoginResponseModel(
        error: true,
        message: message,
        result: null,
      ),
    );
  }

}
