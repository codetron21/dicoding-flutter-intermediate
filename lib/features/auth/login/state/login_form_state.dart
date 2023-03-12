
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_form_state.freezed.dart';

@freezed
@immutable
class LoginFormState with _$LoginFormState {
  const LoginFormState._();

  const factory LoginFormState({
    @Default('') String email,
    @Default('') String password,
    @Default('') String messageEmailError,
    @Default('') String messagePasswordError,
    @Default(false) bool isPasswordVisible,
  }) = _LoginFormState;

  bool get isEmailError => messageEmailError.isNotEmpty;

  bool get isPasswordError => messagePasswordError.isNotEmpty;

  bool get hasErrors => email.isEmpty || password.isEmpty;

}
