import 'package:dicoding_story_app/common/widgets.dart';
import 'package:dicoding_story_app/features/auth/login/state/login_form_notifier.dart';
import 'package:dicoding_story_app/features/auth/login/state/login_notifier.dart';
import 'package:dicoding_story_app/main_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  static const valueKey = ValueKey('LoginScreen');

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainNotifier = ref.read(MainNotifier.provider.notifier);
    final loginFormState = ref.watch(LoginFormNotifier.provider);
    final loginFormNotifier = ref.read(LoginFormNotifier.provider.notifier);
    final loginState = ref.watch(LoginNotifier.provider);
    final loginNotifier = ref.watch(LoginNotifier.provider.notifier);

    ref.listen(LoginNotifier.provider, (_, next) {
      if (next.isSuccess || next.isError) {
        confirmDialog(
            context: context,
            message: next.message,
            callback: () {
              if (next.isSuccess) {
                mainNotifier.navigateToMain(next.token);
              }
            });
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Stack(children: [
        SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Email Address',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter email address",
                    enabled: !loginState.isLoading,
                  ),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  onChanged: loginFormNotifier.onEmailChanged,
                ),
                loginFormState.isEmailError
                    ? Text(
                        loginFormState.messageEmailError,
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
                    hintText: "Enter password",
                    enabled: !loginState.isLoading,
                    suffixIcon: InkWell(
                      child: Icon(
                        loginFormState.isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onTap: () {
                        loginFormNotifier.onVisibilityPasswordClicked();
                      },
                    ),
                  ),
                  textInputAction: TextInputAction.done,
                  obscureText: !loginFormState.isPasswordVisible,
                  onChanged: loginFormNotifier.onPasswordChanged,
                ),
                loginFormState.isPasswordError
                    ? Text(
                        loginFormState.messagePasswordError,
                        style: const TextStyle(
                          color: Colors.red,
                          fontSize: 12,
                        ),
                      )
                    : Container(),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: loginState.isLoading
                      ? null
                      : () {
                          final result = loginFormNotifier.onLoginPressed();
                          if (!result) return;

                          final email = loginFormState.email;
                          final password = loginFormState.password;

                          loginNotifier.onLoginPressed(
                            email: email,
                            password: password,
                          );
                        },
                  child: const Text('Login'),
                ),
                TextButton(
                  onPressed: loginState.isLoading
                      ? null
                      : () {
                          mainNotifier.navigateToRegister();
                        },
                  child: const Text('Register'),
                ),
              ],
            ),
          ),
        ),
        loginState.isLoading
            ? const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              )
            : Container(),
      ]),
    );
  }
}
