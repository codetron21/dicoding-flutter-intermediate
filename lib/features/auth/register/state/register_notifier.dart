import 'package:dicoding_story_app/features/auth/register/model/register_request_model.dart';
import 'package:dicoding_story_app/features/auth/register/services/register_services.dart';
import 'package:dicoding_story_app/features/auth/register/state/register_state.dart';
import 'package:dicoding_story_app/main_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterNotifier extends StateNotifier<RegisterState> {
  static final provider =
      StateNotifierProvider.autoDispose<RegisterNotifier, RegisterState>(
    (ref) {
      final mainNotifier = ref.read(MainNotifier.provider.notifier);
      final service = ref.read(RegisterServices.provider);
      return RegisterNotifier(
        services: service,
        mainNotifier: mainNotifier,
      );
    },
  );

  final MainNotifier _mainNotifier;
  final RegisterServices _services;

  RegisterNotifier({
    required services,
    required mainNotifier,
  })  : _services = services,
        _mainNotifier = mainNotifier,
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
      _mainNotifier.navigateToDialog(message: state.message);
    } catch (err) {
      state = state.makeError("$err");
    }
  }
}
