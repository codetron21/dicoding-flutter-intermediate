import 'package:dicoding_story_app/features/auth/login/login_screen.dart';
import 'package:dicoding_story_app/features/auth/register/register_screen.dart';
import 'package:dicoding_story_app/features/story/add/add_story_screen.dart';
import 'package:dicoding_story_app/features/story/detail/detail_story_screen.dart';
import 'package:dicoding_story_app/features/story/list/list_story_screen.dart';
import 'package:dicoding_story_app/main_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: DicodingStoryApp()));
}

class DicodingStoryApp extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainProvider = ref.watch(MainProvider.provider);
    final mainNotifier = ref.read(MainProvider.provider.notifier);

    final authStack = [
      MaterialPage(
        key: LoginScreen.valueKey,
        child: LoginScreen(),
      ),
      if (mainProvider.isRegister)
        MaterialPage(
          key: RegisterScreen.valueKey,
          child: RegisterScreen(),
        ),
    ];

    final mainStack = [
      MaterialPage(
        key: ListStoryScreen.valueKey,
        child: ListStoryScreen(),
      ),
      MaterialPage(
        key: DetailStoryScreen.valueKey,
        child: DetailStoryScreen(),
      ),
      if (mainProvider.isAddStory)
        MaterialPage(
          key: AddStoryScreen.valueKey,
          child: AddStoryScreen(),
        ),
    ];

    final historyStack = mainProvider.isUserLoggedIn ? mainStack : authStack;

    return MaterialApp(
      title: 'Dicoding Story App',
      home: Navigator(
        pages: historyStack,
        onPopPage: (route, result) {
          final key = route.settings as ValueKey;
          mainNotifier.onPop();
          return route.didPop(result);
        },
      ),
    );
  }
}
