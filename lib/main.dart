import 'package:dicoding_story_app/features/auth/login/screen/login_screen.dart';
import 'package:dicoding_story_app/features/auth/register/screen/register_screen.dart';
import 'package:dicoding_story_app/features/dialog/screen/dialog_screen.dart';
import 'package:dicoding_story_app/features/story/add/screen/add_story_screen.dart';
import 'package:dicoding_story_app/features/story/add/screen/camera_screen.dart';
import 'package:dicoding_story_app/features/story/detail/screen/detail_story_screen.dart';
import 'package:dicoding_story_app/features/story/list/screen/list_story_screen.dart';
import 'package:dicoding_story_app/main/main_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() {
  runApp(ProviderScope(child: DicodingStoryApp()));
}

class DicodingStoryApp extends ConsumerWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  DicodingStoryApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mainState = ref.watch(MainNotifier.provider);
    final mainNotifier = ref.read(MainNotifier.provider.notifier);

    final authStack = [
      const MaterialPage(
        key: LoginScreen.valueKey,
        child: LoginScreen(),
      ),
      if (mainState.isRegister)
        const MaterialPage(
          key: RegisterScreen.valueKey,
          child: RegisterScreen(),
        ),
      if (mainState.isShowDialog)
        ConfirmDialogScreen(
          message: mainState.message ?? '',
          callback: () {
            if (mainState.userToken != null) {
              mainNotifier.navigateToMain();
            }
            mainNotifier.onPop();
          },
        ),
    ];

    final mainStack = [
      const MaterialPage(
        key: ListStoryScreen.valueKey,
        child: ListStoryScreen(),
      ),
      if (mainState.storyIdExists)
        const MaterialPage(
          key: DetailStoryScreen.valueKey,
          child: DetailStoryScreen(),
        ),
      if (mainState.isAddStory)
        const MaterialPage(
          key: AddStoryScreen.valueKey,
          child: AddStoryScreen(),
        ),
      if (mainState.cameraExists)
        const MaterialPage(
          key: CameraScreen.valueKey,
          child: CameraScreen(),
        ),
      if (mainState.isShowDialog)
        ConfirmDialogScreen(
          message: mainState.message ?? '',
          callback: () {
            mainNotifier
              ..returnData(true)
              ..backToMain();
          },
        ),
      if (mainState.isShowConfirmDialog)
        ConfirmOptionsDialogScreen(
          message: mainState.message ?? '',
          callbackYes: () {
            if (mainState.commandLogout) {
              mainNotifier.navigateToAuth();
            }
            mainNotifier.onPop();
          },
          callbackNo: () {
            mainNotifier.onPop();
          },
        ),
    ];

    final historyStack = mainState.isUserLoggedIn ? mainStack : authStack;

    return MaterialApp(
      title: 'Dicoding Story App',
      home: Navigator(
        key: navigatorKey,
        pages: historyStack,
        onPopPage: (route, result) {
          mainNotifier.onPop();
          return route.didPop(result);
        },
      ),
    );
  }
}
