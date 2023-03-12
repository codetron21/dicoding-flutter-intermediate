import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_story_app/common/preferences.dart';
import 'package:dicoding_story_app/features/story/detail/state/detail_story_notifier.dart';
import 'package:dicoding_story_app/main/main_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailStoryScreen extends ConsumerStatefulWidget {
  static const valueKey = ValueKey('DetailStoryScreen');

  const DetailStoryScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return DetailStoryState();
  }
}

class DetailStoryState extends ConsumerState<DetailStoryScreen> {
  @override
  void initState() {
    super.initState();
    final sharedPref = ref.read(LoginPreferences.provider);
    final storyId = ref.read(MainNotifier.provider).storyId;

    sharedPref.getToken().then((token) {
      if (token == null || storyId == null) return;
      ref.read(DetailStoryNotifier.provider.notifier).getStory(token, storyId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final detailState = ref.watch(DetailStoryNotifier.provider);
    return Scaffold(
        appBar: AppBar(
          title: const Text('Detail Story'),
        ),
        body: Stack(
          children: [
            if (detailState.model != null)
              SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Stack(
                    children: [
                      CachedNetworkImage(
                        imageUrl: detailState.model!.story.photoUrl,
                        fit: BoxFit.cover,
                        width: double.infinity,
                        height: 200,
                        placeholder: (context, _) {
                          return Expanded(
                            child: Container(
                              color: Theme.of(context).primaryColor,
                            ),
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
                            detailState.model!.story.createdAt,
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
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          detailState.model!.story.name,
                          style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black),
                        ),
                        const SizedBox(height: 8),
                        const Text(
                          'Description',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          detailState.model!.story.description,
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ],
              )),
            if (detailState.isLoading)
              const Align(
                alignment: Alignment.center,
                child: CircularProgressIndicator(),
              ),
            if (detailState.isError)
              Align(
                alignment: Alignment.center,
                child: Text(
                  detailState.message,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 18,
                  ),
                ),
              ),
          ],
        ));
  }
}