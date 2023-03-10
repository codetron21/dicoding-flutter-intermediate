import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_response_model.g.dart';

@JsonSerializable()
class RegisterResponseModel {
  @JsonKey(name: 'error')
  final bool error;
  @JsonKey(name: 'message')
  final String message;

  const RegisterResponseModel({
    required this.error,
    required this.message,
  });

  factory RegisterResponseModel.fromJson(Map<String, dynamic> json) =>
      _$RegisterResponseModelFromJson(json);
}
