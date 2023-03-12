import 'package:dicoding_story_app/features/auth/login/model/login_request_model.dart';
import 'package:dicoding_story_app/features/auth/login/services/login_services.dart';
import 'package:dicoding_story_app/features/auth/login/state/login_state.dart';
import 'package:dicoding_story_app/main/main_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginNotifier extends StateNotifier<LoginState> {
  static final provider =
      StateNotifierProvider.autoDispose<LoginNotifier, LoginState>(
    (ref) {
      final service = ref.read(LoginServices.provider);
      final mainNotifier = ref.read(MainNotifier.provider.notifier);
      return LoginNotifier(
        services: service,
        mainNotifier: mainNotifier,
      );
    },
  );

  final MainNotifier _mainNotifier;
  final LoginServices _services;

  LoginNotifier({
    required services,
    required mainNotifier,
  })  : _services = services,
        _mainNotifier = mainNotifier,
        super(const LoginState());

  void navigateToRegister() {
    _mainNotifier.navigateToRegister();
  }

  void onLogin({
    required String email,
    required String password,
  }) async {
    try {
      state = state.copyWith(isLoading: true);

      final model = LoginRequestModel(
        email: email,
        password: password,
      );

      final result = await _services.login(model);
      state = state.copyWith(isLoading: false, model: result);

      _mainNotifier
        ..setToken(state.token)
        ..navigateToDialog(message: state.message);
    } catch (err) {
      state = LoginState.makeError("$err");
    }
  }
}
