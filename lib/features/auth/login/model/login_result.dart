import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_result.g.dart';

@JsonSerializable()
class LoginResult {
  @JsonKey(name: 'userId')
  final String userId;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'token')
  final String token;

  const LoginResult({
    required this.userId,
    required this.name,
    required this.token,
  });

  factory LoginResult.fromJson(Map<String, dynamic> json) => _$LoginResultFromJson(json);

}