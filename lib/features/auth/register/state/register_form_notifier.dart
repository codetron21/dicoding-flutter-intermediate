import 'package:dicoding_story_app/common/constants.dart';
import 'package:dicoding_story_app/features/auth/register/state/register_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  static final provider =
      StateNotifierProvider.autoDispose<RegisterFormNotifier, RegisterFormState>(
          (ref) => RegisterFormNotifier());

  RegisterFormNotifier() : super(RegisterFormState.init());

  void onNameChange(String value) {
    final name = value.trim();

    state = state.copy(name: name);

    if (name.isEmpty) {
      state = state.copy(messageNameError: "Name can't be empty.");
      return;
    }

    state = state.removeNameError();
  }

  void onEmailChanged(String value) {
    final email = value.trim();

    state = state.copy(email: email);

    if (email.isEmpty) {
      state = state.copy(messageEmailError: "Email can't be empty.");
      return;
    }

    if (!RegExp(kEmailPattern).hasMatch(email)) {
      state = state.copy(messageEmailError: "Email is not valid.");
      return;
    }

    state = state.removeEmailError();
  }

  void onPasswordChanged(String value) {
    final password = value.trim();

    state = state.copy(password: password);

    if (password.isEmpty) {
      state = state.copy(messagePasswordError: "Password can't be empty.");
      return;
    }

    if (password.length < 6) {
      state = state.copy(
          messagePasswordError: "Password must be at least 6 chars.");
      return;
    }

    state = state.removePasswordError();
  }

  void onPasswordConfirmChanged(String value) {
    final confirmPassword = value.trim();

    state = state.copy(confirmPassword: confirmPassword);

    if (confirmPassword.isEmpty) {
      state = state.copy(
          messagePasswordConfirmError: "Confirm password can't be empty.");
      return;
    }

    if (confirmPassword.length < 6) {
      state = state.copy(
          messagePasswordConfirmError:
              "Confirm password must be at least 6 chars.");
      return;
    }

    final password = state.password;
    if (confirmPassword != password) {
      state = state.copy(
          messagePasswordConfirmError:
              "Confirm password must be same as password.");
      return;
    }

    state = state.removePasswordConfirmError();
  }

  void onVisibilityPasswordClicked() {
    state = state.copy(isPasswordVisible: !state.isPasswordVisible);
  }

  void onVisibilityPasswordConfirmClicked() {
    state =
        state.copy(isPasswordConfirmVisible: !state.isPasswordConfirmVisible);
  }

  bool onRegisterPressed() {
    final name = state.name;
    final email = state.email;
    final password = state.password;
    final confirmPassword = state.confirmPassword;

    if (state.hasErrors) {
      onNameChange(name);
      onEmailChanged(email);
      onPasswordChanged(password);
      onPasswordConfirmChanged(confirmPassword);
      return false;
    }

    return true;
  }
}
