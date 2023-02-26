import 'package:dicoding_story_app/features/auth/register/model/register_request_model.dart';
import 'package:dicoding_story_app/features/auth/register/services/register_services.dart';
import 'package:dicoding_story_app/features/auth/register/state/register_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  static final provider =
      StateNotifierProvider<RegisterNotifier, RegisterState>(
    (ref) => RegisterNotifier(
      services: ref.read(RegisterServices.provider),
    ),
  );

  final RegisterServices _services;

  RegisterNotifier({required services})
      : _services = services,
        super(RegisterState.init());

  void onRegisterPressed({
    required String name,
    required String email,
    required String password,
  }) async {
    state = state.makeLoading(true);

    final model = RegisterRequestModel(
      name: name,
      email: email,
      password: password,
    );

    try {
      final result = await _services.register(model);
      state = state.getResult(result);
    } catch (err) {
      state = state.makeError("$err");
    }
  }
}
