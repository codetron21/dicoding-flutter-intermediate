import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_form_state.freezed.dart';

@freezed
@immutable
class RegisterFormState with _$RegisterFormState {
  const RegisterFormState._();

  const factory RegisterFormState({
    @Default('') String name,
    @Default('') String email,
    @Default('') String password,
    @Default('') String confirmPassword,
    @Default('') String messageNameError,
    @Default('') String messageEmailError,
    @Default('') String messagePasswordError,
    @Default('') String messagePasswordConfirmError,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isPasswordConfirmVisible,
  }) = _RegisterFormState;

  bool get isEmailError => messageEmailError.isNotEmpty;

  bool get isPasswordError => messagePasswordError.isNotEmpty;

  bool get isPasswordConfirmError => messagePasswordConfirmError.isNotEmpty;

  bool get isNameError => messageNameError.isNotEmpty;

  bool get hasErrors =>
      name.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      confirmPassword.isEmpty;
}
