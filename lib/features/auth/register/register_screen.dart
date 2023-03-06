import 'package:dicoding_story_app/features/auth/register/state/register_form_notifier.dart';
import 'package:dicoding_story_app/features/auth/register/state/register_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RegisterScreen extends ConsumerWidget {
  static const valueKey = ValueKey('RegisterScreen');

  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final registerFormState = ref.watch(RegisterFormNotifier.provider);
    final registerFormNotifier =
        ref.read(RegisterFormNotifier.provider.notifier);
    final registerState = ref.watch(RegisterNotifier.provider);
    final registerNotifier = ref.watch(RegisterNotifier.provider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: !registerState.isLoading,
                    hintText: "Enter name",
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.name,
                  onChanged: registerFormNotifier.onNameChange,
                ),
                registerFormState.isNameError
                    ? Text(
                        registerFormState.messageNameError,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 8),
                const Text(
                  'Email',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: !registerState.isLoading,
                    hintText: "Enter email address",
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: registerFormNotifier.onEmailChanged,
                ),
                registerFormState.isEmailError
                    ? Text(
                        registerFormState.messageEmailError,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 8),
                const Text(
                  'Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: !registerState.isLoading,
                    hintText: "Enter password",
                    suffixIcon: InkWell(
                      canRequestFocus: false,
                      child: Icon(
                        registerFormState.isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        registerFormNotifier.onVisibilityPasswordClicked();
                      },
                    ),
                  ),
                  textInputAction: TextInputAction.next,
                  obscureText: !registerFormState.isPasswordVisible,
                  onChanged: registerFormNotifier.onPasswordChanged,
                ),
                registerFormState.isPasswordError
                    ? Text(
                        registerFormState.messagePasswordError,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 8),
                const Text(
                  'Confirm Password',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    enabled: !registerState.isLoading,
                    hintText: "Enter confirm password",
                    suffixIcon: InkWell(
                      child: Icon(
                        registerFormState.isPasswordConfirmVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        registerFormNotifier
                            .onVisibilityPasswordConfirmClicked();
                      },
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  obscureText: !registerFormState.isPasswordConfirmVisible,
                  onChanged: registerFormNotifier.onPasswordConfirmChanged,
                ),
                registerFormState.isPasswordConfirmError
                    ? Text(
                        registerFormState.messagePasswordConfirmError,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: registerState.isLoading
                      ? null
                      : () {
                          final result =
                              registerFormNotifier.onRegisterPressed();
                          if (!result) return;

                          final name = registerFormState.name;
                          final email = registerFormState.email;
                          final password = registerFormState.password;

                          registerNotifier.onRegisterPressed(
                            name: name,
                            email: email,
                            password: password,
                          );
                        },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
        registerState.isLoading
            ? const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container(),
      ]),
    );
  }
}
