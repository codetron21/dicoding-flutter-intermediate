import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_story_app/features/story/list/state/list_story_notifier.dart';
import 'package:dicoding_story_app/features/story/model/story_response_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListStoryScreen extends ConsumerWidget {
  static const valueKey = ValueKey('ListStoryScreen');

  const ListStoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listStoryState = ref.watch(ListStoryNotifier.provider);
    final listStoryNotifier = ref.read(ListStoryNotifier.provider.notifier);

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
                listStoryNotifier.onAddClicked();
              },
        child: const Icon(Icons.add),
      ),
      body: Stack(
        children: [
          if (!listStoryState.isError)
            ListView.separated(
              padding: const EdgeInsets.all(8),
              itemBuilder: (context, index) {
                final story = listStoryState.model?.listStory[index];
                if (story == null) return Container();
                return _StoryItem(
                  story: story,
                  callback: (storyId) {
                    listStoryNotifier.onItemClicked(storyId);
                  },
                );
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
}

class _StoryItem extends StatelessWidget {
  final StoryResponseModel story;
  final Function(String)? callback;

  const _StoryItem({
    Key? key,
    required this.story,
    this.callback,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
