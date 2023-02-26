class LoginFormState {
  final String email;
  final String password;
  final String messageEmailError;
  final String messagePasswordError;
  final bool isPasswordVisible;

  const LoginFormState({
    required this.email,
    required this.password,
    this.messageEmailError = "",
    this.messagePasswordError = "",
    this.isPasswordVisible = false,
  });

  factory LoginFormState.init() {
    return const LoginFormState(email: "", password: "");
  }

  bool get isEmailError => messageEmailError.isNotEmpty;

  bool get isPasswordError => messagePasswordError.isNotEmpty;

  LoginFormState copy({
    String? email,
    String? password,
    String? messageEmailError,
    String? messagePasswordError,
    bool? isPasswordVisible,
  }) {
    return LoginFormState(
      email: email ?? this.email,
      password: password ?? this.password,
      messageEmailError: messageEmailError ?? this.messageEmailError,
      messagePasswordError: messagePasswordError ?? this.messagePasswordError,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
    );
  }

  bool get hasErrors => email.isEmpty || password.isEmpty;

  LoginFormState removeEmailError() {
    return copy(messageEmailError: "");
  }

  LoginFormState removePasswordError() {
    return copy(messagePasswordError: "");
  }
}
