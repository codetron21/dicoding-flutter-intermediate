import 'package:dicoding_story_app/features/auth/login/model/login_request_model.dart';
import 'package:dicoding_story_app/features/auth/login/services/login_services.dart';
import 'package:dicoding_story_app/features/auth/login/state/login_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  static final provider = StateNotifierProvider<LoginNotifier, LoginState>(
    (ref) => LoginNotifier(
      services: ref.read(LoginServices.provider),
    ),
  );

  final LoginServices _services;

  LoginNotifier({required services})
      : _services = services,
        super(LoginState.init());

  void onLoginPressed({
    required String email,
    required String password,
  }) async {
    state = state.makeLoading(true);

    final model = LoginRequestModel(
      email: email,
      password: password,
    );

    try {
      final result = await _services.login(model);
      state = state.getResult(result);
    } catch (err) {
      state = state.makeError("$err");
    }
  }
}
