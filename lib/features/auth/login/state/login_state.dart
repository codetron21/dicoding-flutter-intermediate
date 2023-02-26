import 'package:dicoding_story_app/features/auth/login/model/login_response_model.dart';

class LoginState {
  final LoginResponseModel? response;
  final bool isLoading;

  const LoginState({
    this.response,
    this.isLoading = false,
  });

  factory LoginState.init() {
    return const LoginState(
      response: null,
      isLoading: false,
    );
  }

  bool get isError => response?.error ?? false;

  bool get isSuccess => !(response?.error ?? true);

  String get message => response?.message ?? "";

  String? get token => response?.result?.token;

  LoginState copy({
    LoginResponseModel? response,
    bool? isLoading,
  }) {
    return LoginState(
      response: response ?? this.response,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  LoginState makeLoading(bool loading) {
    return LoginState(
      isLoading: loading,
      response: null,
    );
  }

  LoginState makeError(String message) {
    return LoginState(
      isLoading: false,
      response: LoginResponseModel(
        error: true,
        message: message,
        result: null,
      ),
    );
  }

  LoginState getResult(LoginResponseModel model) {
    return LoginState(
      isLoading: false,
      response: model,
    );
  }
}
