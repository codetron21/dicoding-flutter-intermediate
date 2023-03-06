import 'dart:async';

import 'package:camera/camera.dart';
import 'package:dicoding_story_app/common/preferences.dart';
import 'package:dicoding_story_app/main_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MainNotifier extends StateNotifier<MainState> {
  static final provider = StateNotifierProvider<MainNotifier, MainState>(
    (ref) => MainNotifier(
      ref.read(LoginPreferences.provider),
    ),
  );

  final LoginPreferences _preferences;

  Completer<bool> _completer = Completer();

  MainNotifier(this._preferences) : super(MainState.init()) {
    _init();
  }

  void _init() async {
    String? token = await _preferences.getToken();
    if (token == null) return;
    state = state.copy(userToken: token, isUserLoggedIn: true);
  }

  Future<bool> waitForResult() async {
    _completer = Completer<bool>();
    return _completer.future;
  }

  void returnData(bool value) {
    _completer.complete(value);
  }

  void navigateToRegister() {
    state = state.copy(isRegister: true);
  }

  void navigateToMain() async {
    String? token = state.userToken;
    if (token == null) return;
    final result = await _preferences.setToken(token);
    if (!result) return;
    state = state.copy(userToken: token, isUserLoggedIn: true);
  }

  void navigateToAuth() async {
    final result = await _preferences.removeToken();
    if (!result) return;
    state = MainState.init();
  }

  void navigateToDetail(String? storyId) {
    if (storyId == null) return;
    state = state.copy(storyId: storyId);
  }

  void navigateToAdd() {
    state = state.copy(isAddStory: true);
  }

  void navigateToCamera(List<CameraDescription> cameras) {
    state = state.copy(cameras: cameras);
  }

  void navigateToDialog({String? message}) {
    state = state.copy(
      isShowDialog: true,
      message: message,
    );
  }

  void setToken(String? token) {
    state = state.copy(userToken: token);
  }

  void navigateToOptionsDialog(
    String? message,
    bool? commandLogout,
  ) {
    state = state.copy(
      isShowConfirmDialog: true,
      message: message,
      commandLogout: commandLogout ?? false,
    );
  }

  void backToMain() {
    state = state.copy(
      isShowDialog: false,
      message: null,
      isAddStory: false,
    );
  }

  void onPop() {
    if (state.isShowDialog) {
      state = state.copy(
        isShowDialog: false,
        message: null,
      );
      return;
    }

    if (state.isShowConfirmDialog) {
      state = state.copy(
        isShowConfirmDialog: false,
        message: null,
        commandLogout: state.commandLogout ? false : false,
      );
      return;
    }

    if (state.isRegister) {
      state = state.copy(isRegister: false);
      return;
    }

    if (state.cameras != null) {
      state = state.resetCamera();
      return;
    }

    if (state.isAddStory) {
      state = state.resetMain();
      return;
    }

    if (state.storyId != null) {
      state = state.resetMain();
      return;
    }
  }
}
