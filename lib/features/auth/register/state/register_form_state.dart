class RegisterFormState {
  final String name;
  final String email;
  final String password;
  final String confirmPassword;
  final String messageNameError;
  final String messageEmailError;
  final String messagePasswordError;
  final String messagePasswordConfirmError;
  final bool isPasswordVisible;
  final bool isPasswordConfirmVisible;

  const RegisterFormState({
    required this.name,
    required this.email,
    required this.password,
    required this.confirmPassword,
    this.messageNameError = "",
    this.messageEmailError = "",
    this.messagePasswordError = "",
    this.messagePasswordConfirmError = "",
    this.isPasswordVisible = false,
    this.isPasswordConfirmVisible = false,
  });

  factory RegisterFormState.init() {
    return const RegisterFormState(
      name: "",
      email: "",
      password: "",
      confirmPassword: "",
    );
  }

  bool get isEmailError => messageEmailError.isNotEmpty;

  bool get isPasswordError => messagePasswordError.isNotEmpty;

  bool get isPasswordConfirmError => messagePasswordConfirmError.isNotEmpty;

  bool get isNameError => messageNameError.isNotEmpty;

  RegisterFormState copy({
    String? name,
    String? email,
    String? password,
    String? confirmPassword,
    String? messageNameError,
    String? messageEmailError,
    String? messagePasswordError,
    String? messagePasswordConfirmError,
    bool? isPasswordVisible,
    bool? isPasswordConfirmVisible,
  }) {
    return RegisterFormState(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      messageNameError: messageNameError ?? this.messageNameError,
      messageEmailError: messageEmailError ?? this.messageEmailError,
      messagePasswordError: messagePasswordError ?? this.messagePasswordError,
      messagePasswordConfirmError:
          messagePasswordConfirmError ?? this.messagePasswordConfirmError,
      isPasswordVisible: isPasswordVisible ?? this.isPasswordVisible,
      isPasswordConfirmVisible:
          isPasswordConfirmVisible ?? this.isPasswordConfirmVisible,
    );
  }

  bool get hasErrors =>
      name.isEmpty ||
      email.isEmpty ||
      password.isEmpty ||
      confirmPassword.isEmpty;

  RegisterFormState removeNameError() {
    return copy(messageNameError: "");
  }

  RegisterFormState removeEmailError() {
    return copy(messageEmailError: "");
  }

  RegisterFormState removePasswordError() {
    return copy(messagePasswordError: "");
  }

  RegisterFormState removePasswordConfirmError() {
    return copy(messagePasswordConfirmError: "");
  }
}
