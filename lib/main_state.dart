import 'dart:ffi';

class MainState {
  final String? userToken;
  final bool isRegister;
  final bool isAddStory;
  final String? storyId;

  const MainState({
    this.userToken,
    required this.isRegister,
    required this.isAddStory,
    this.storyId,
  });

  factory MainState.init() {
    return const MainState(
      userToken: null,
      isRegister: false,
      isAddStory: false,
      storyId: null,
    );
  }

  MainState copy({
    String? userToken,
    bool? isRegister,
    bool? isAddStory,
    String? storyId,
  }) {
    return MainState(
      userToken: userToken ?? this.userToken,
      isRegister: isRegister ?? this.isRegister,
      isAddStory: isAddStory ?? this.isAddStory,
      storyId: storyId ?? this.storyId,
    );
  }

  MainState resetMain() {
    return MainState(
      userToken: userToken,
      isRegister: false,
      isAddStory: false,
      storyId: null,
    );
  }

  bool get isUserLoggedIn => userToken != null;

  bool get storyIdExists => storyId != null;
}
