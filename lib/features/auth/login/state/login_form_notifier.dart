import 'package:dicoding_story_app/common/constants.dart';
import 'package:dicoding_story_app/features/auth/login/state/login_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  static final provider = StateNotifierProvider<LoginFormNotifier, LoginFormState>(
      (ref) => LoginFormNotifier());

  LoginFormNotifier() : super(LoginFormState.init());

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

  bool onLoginPressed() {
    final email = state.email;
    final password = state.password;

    if (state.hasErrors) {
      onEmailChanged(email);
      onPasswordChanged(password);
      return false;
    }

    return true;
  }

  void onVisibilityPasswordClicked() {
    state = state.copy(isPasswordVisible: !state.isPasswordVisible);
  }
}
