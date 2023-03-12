import 'package:dicoding_story_app/common/constants.dart';
import 'package:dicoding_story_app/features/auth/login/state/login_form_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginFormNotifier extends StateNotifier<LoginFormState> {
  static final provider =
      StateNotifierProvider.autoDispose<LoginFormNotifier, LoginFormState>(
          (ref) => LoginFormNotifier());

  LoginFormNotifier() : super(const LoginFormState());

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

    state = state.copyWith(messageEmailError: '');
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

  void onLoginPressed(void Function(String email, String password) callback) {
    final email = state.email;
    final password = state.password;

    if (state.hasErrors) {
      onEmailChanged(email);
      onPasswordChanged(password);
      return;
    }

    callback( email, password);
  }

  void onVisibilityPasswordClicked() {
    state = state.copyWith(isPasswordVisible: !state.isPasswordVisible);
  }
}
