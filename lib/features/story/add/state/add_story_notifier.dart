import 'package:dicoding_story_app/features/story/add/state/add_story_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddStoryNotifier extends StateNotifier<AddStoryState> {
  static final provider = StateNotifierProvider<AddStoryNotifier, AddStoryState>(
      (ref) => AddStoryNotifier());

  AddStoryNotifier() : super(AddStoryState.init());


}
