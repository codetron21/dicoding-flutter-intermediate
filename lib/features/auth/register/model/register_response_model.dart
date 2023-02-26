class RegisterResponseModel {
  final bool error;
  final String message;

  const RegisterResponseModel({
    required this.error,
    required this.message,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) {
    return RegisterResponseModel(
      error: json['error'],
      message: json['message'],
    );
  }

}
