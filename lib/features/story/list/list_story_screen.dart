import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_story_app/common/preferences.dart';
import 'package:dicoding_story_app/common/widgets.dart';
import 'package:dicoding_story_app/features/story/list/state/list_story_notifier.dart';
import 'package:dicoding_story_app/features/story/model/story_response_model.dart';
import 'package:dicoding_story_app/main_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListStoryScreen extends ConsumerStatefulWidget {
  static const valueKey = ValueKey('ListStoryScreen');

  const ListStoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return ListStoryState();
  }
}

class ListStoryState extends ConsumerState<ListStoryScreen> {
  @override
  void initState() {
    super.initState();
    _getStories();
  }

  void _getStories() {
    final sharedPref = ref.read(LoginPreferences.provider);
    sharedPref.getToken().then((token) {
      if (token == null) return;
      ref.read(ListStoryNotifier.provider.notifier).getAll(token);
    });
  }

  @override
  Widget build(BuildContext context) {
    final listStoryState = ref.watch(ListStoryNotifier.provider);
    final listStoryNotifier = ref.watch(ListStoryNotifier.provider.notifier);
    final mainNotifier = ref.read(MainNotifier.provider.notifier);

    ref.listen(ListStoryNotifier.provider, (previous, next) {
      if (next.showLogoutDialog) {
        confirmOptionsDialog(
          context: context,
          message: "Do you want to logout?",
          callback: () {
            mainNotifier.navigateToAuth();
          },
        );
      }
    });

    return Scaffold(
      appBar: AppBar(
        title: const Text('Stories'),
        actions: [
          IconButton(
            icon: const Icon(Icons.exit_to_app),
            onPressed: () {
              listStoryNotifier.onLogoutMenuClicked();
            },
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: listStoryState.isLoading
            ? null
            : () {
                mainNotifier.waitForResult().then((value) {
                  if (value) _getStories();
                });

                mainNotifier.navigateToAdd();
              },
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          if (listStoryState.isSuccess)
            ListView.separated(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final story = listStoryState.model?.listStory[index];
                if (story == null) return Container();
                return _storyItem(context, story, callback: (storyId) {
                  mainNotifier.navigateToDetail(storyId);
                });
              },
              separatorBuilder: (context, index) {
                return const SizedBox(height: 8);
              },
              itemCount: listStoryState.model?.listStory.length ?? 0,
            ),
          if (listStoryState.isError)
            Align(
              alignment: Alignment.center,
              child: Text(
                listStoryState.message,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            ),
          if (listStoryState.isLoading)
            const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }

  Widget _storyItem(BuildContext context, Story story,
      {Function(String)? callback}) {
    return Card(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      child: InkWell(
        onTap: () {
          callback?.call(story.id);
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(
              children: [
                CachedNetworkImage(
                  imageUrl: story.photoUrl,
                  fit: BoxFit.cover,
                  width: double.infinity,
                  height: 120,
                  placeholder: (context, _) {
                    return Container(
                      color: Theme.of(context).primaryColor,
                    );
                  },
                ),
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(8),
                      ),
                    ),
                    child: Text(
                      story.createdAt,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    story.name,
                    maxLines: 1,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    story.description,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
