import 'package:cached_network_image/cached_network_image.dart';
import 'package:dicoding_story_app/features/story/detail/state/detail_story_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailStoryScreen extends ConsumerWidget {
  static const valueKey = ValueKey('DetailStoryScreen');

  const DetailStoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                        imageUrl: detailState.model?.story?.photoUrl ?? '',
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
                            detailState.model?.story?.createdAt ?? '',
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
                          detailState.model?.story?.name ?? '',
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
                          detailState.model?.story?.description ?? '',
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
