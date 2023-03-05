class AuthState {
  final String? userToken;
  final String? message;
  final bool isRegister;
  final bool isShowDialog;

  const AuthState({
    this.userToken,
    this.message,
    this.isShowDialog = false,
    this.isRegister = false,
  });

  AuthState copy({
    String? userToken,
    bool? isRegister,
    bool isShowDialog = false,
    String? message,
  }) {
    return AuthState(
      userToken: userToken ?? this.userToken,
      isRegister: isRegister ?? this.isRegister,
      isShowDialog: isShowDialog,
      message: message,
    );
  }

  bool get isUserLoggedIn => userToken != null;
}
