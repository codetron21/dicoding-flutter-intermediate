import 'package:dicoding_story_app/features/auth/login/model/login_result.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'error')
  final bool error;
  @JsonKey(name: 'message')
  final String message;
  @JsonKey(name: 'loginResult')
  final LoginResult? result;

  const LoginResponseModel({
    required this.error,
    required this.message,
    this.result,
  });

  factory LoginResponseModel.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseModelFromJson(json);
}
