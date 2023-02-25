class MainState {
  final bool isUserLoggedIn;
  final bool isRegister;
  final bool isAddStory;

  const MainState({
    required this.isUserLoggedIn,
    required this.isRegister,
    required this.isAddStory,
  });

  factory MainState.init() {
    return const MainState(
      isUserLoggedIn: false,
      isRegister: false,
      isAddStory: false,
    );
  }

  factory MainState.register() {
    return const MainState(
      isUserLoggedIn: false,
      isRegister: true,
      isAddStory: false,
    );
  }

}
