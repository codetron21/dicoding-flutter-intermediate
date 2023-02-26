import 'package:dicoding_story_app/features/auth/register/model/register_response_model.dart';

class RegisterState {
  final RegisterResponseModel? response;
  final bool isLoading;

  const RegisterState({
    this.response,
    this.isLoading = false,
  });

  factory RegisterState.init() {
    return const RegisterState(
      response: null,
      isLoading: false,
    );
  }

  bool get isError => response?.error ?? false;

  bool get isSuccess => !(response?.error ?? true);

  String get message => response?.message ?? "";

  RegisterState copy({
    RegisterResponseModel? response,
    bool? isLoading,
  }) {
    return RegisterState(
      response: response ?? this.response,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  RegisterState makeLoading(bool loading) {
    return RegisterState(
      isLoading: loading,
      response: null,
    );
  }

  RegisterState makeError(String message) {
    return RegisterState(
      isLoading: false,
      response: RegisterResponseModel(
        error: true,
        message: message,
      ),
    );
  }

  RegisterState getResult(RegisterResponseModel model) {
    return RegisterState(
      isLoading: false,
      response: model,
    );
  }
}
