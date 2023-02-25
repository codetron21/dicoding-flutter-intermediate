import 'package:dicoding_story_app/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LoginScreen extends ConsumerWidget {
  static const valueKey = ValueKey('LoginScreen');

  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainNotifier = ref.read(MainProvider.provider.notifier);

    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            mainNotifier.navigateToRegister();
          },
          child: const Text('register'),
        ),
      ),
    );
  }
}
