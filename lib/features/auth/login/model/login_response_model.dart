class LoginResponseModel {
  final bool error;
  final String message;
  final LoginResult? result;

  const LoginResponseModel({
    required this.error,
    required this.message,
    this.result,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) {
    return LoginResponseModel(
      error: json['error'],
      message: json['message'],
      result: LoginResult.fromJson(json['loginResult']),
    );
  }
}

class LoginResult {
  final String userId;
  final String name;
  final String token;

  const LoginResult({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) {
    return LoginResult(
      userId: json['userId'],
      name: json['name'],
      token: json['token'],
    );
  }
}
