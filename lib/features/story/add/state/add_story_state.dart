class AddStoryState {
  final bool isLoading;
  final String errorMessage;

  const AddStoryState({
    required this.isLoading,
    this.errorMessage = "",
  });

  factory AddStoryState.init() {
    return const AddStoryState(isLoading: false);
  }

  AddStoryState copy({
    bool? isLoading,
    String? errorMessage,
  }) {
    return AddStoryState(
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage ?? this.errorMessage,
    );
  }
}
