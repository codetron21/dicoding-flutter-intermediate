import 'package:dicoding_story_app/features/auth/provider/auth_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthNotifier extends StateNotifier<AuthState> {
  static final provider =
      StateNotifierProvider.autoDispose((ref) => AuthNotifier());

  AuthNotifier() : super(const AuthState());

  void navToRegister() {
    state = state.copy(isRegister: true);
  }

  void setToken(String? token) {
    state = state.copy(userToken: token);
  }

  void setMessage(String? message) {
    state = state.copy(message: message);
  }

  void showDialog() {
    state = state.copy(isShowDialog: true);
  }

  void dismissDialog() {
    state = state.copy(isShowDialog: false);
  }

  void onPop() {
    if (state.isRegister) {
      state = state.copy(isRegister: false);
      return;
    }
  }
}
