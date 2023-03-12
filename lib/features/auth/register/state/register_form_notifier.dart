import 'package:dicoding_story_app/common/constants.dart';
import 'package:dicoding_story_app/features/auth/register/state/register_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterFormNotifier extends StateNotifier<RegisterFormState> {
  static final provider = StateNotifierProvider.autoDispose<
      RegisterFormNotifier, RegisterFormState>((ref) => RegisterFormNotifier());

  RegisterFormNotifier() : super(const RegisterFormState());

  void onNameChange(String value) {
    final name = value.trim();

    state = state.copyWith(name: name);

    if (name.isEmpty) {
      state = state.copyWith(messageNameError: "Name can't be empty.");
      return;
    }

    state = state.copyWith(messageNameError: '');
  }

  void onEmailChanged(String value) {
    final email = value.trim();

    state = state.copyWith(email: email);

    if (email.isEmpty) {
      state = state.copyWith(messageEmailError: "Email can't be empty.");
      return;
    }

    if (!RegExp(kEmailPattern).hasMatch(email)) {
      state = state.copyWith(messageEmailError: "Email is not valid.");
      return;
    }

    state = state.copyWith(messageEmailError: "");
  }

  void onPasswordChanged(String value) {
    final password = value.trim();

    state = state.copyWith(password: password);

    if (password.isEmpty) {
      state = state.copyWith(messagePasswordError: "Password can't be empty.");
      return;
    }

    if (password.length < 6) {
      state = state.copyWith(
          messagePasswordError: "Password must be at least 6 chars.");
      return;
    }

    state = state.copyWith(messagePasswordError: "");
  }

  void onPasswordConfirmChanged(String value) {
    final confirmPassword = value.trim();

    state = state.copyWith(confirmPassword: confirmPassword);

    if (confirmPassword.isEmpty) {
      state = state.copyWith(
          messagePasswordConfirmError: "Confirm password can't be empty.");
      return;
    }

    if (confirmPassword.length < 6) {
      state = state.copyWith(
          messagePasswordConfirmError:
              "Confirm password must be at least 6 chars.");
      return;
    }

    final password = state.password;
    if (confirmPassword != password) {
      state = state.copyWith(
          messagePasswordConfirmError:
              "Confirm password must be same as password.");
      return;
    }

    state = state.copyWith(messagePasswordConfirmError: '');
  }

  void onVisibilityPasswordClicked() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }

  void onVisibilityPasswordConfirmClicked() {
    state = state.copyWith(
        isPasswordConfirmVisible: !state.isPasswordConfirmVisible);
  }

  void onRegisterPressed(
    void Function(String name, String email, String password) callback,
  ) {
    final name = state.name;
    final email = state.email;
    final password = state.password;
    final confirmPassword = state.confirmPassword;

    if (state.hasErrors) {
      onNameChange(name);
      onEmailChanged(email);
      onPasswordChanged(password);
      onPasswordConfirmChanged(confirmPassword);
      return;
    }

    callback(name, email, password);
  }
}
