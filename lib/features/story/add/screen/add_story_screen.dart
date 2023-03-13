import 'dart:io';

import 'package:camera/camera.dart';
import 'package:dicoding_story_app/features/story/add/state/add_story_notifier.dart';
import 'package:dicoding_story_app/features/story/add/state/add_story_value_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddStoryScreen extends ConsumerStatefulWidget {
  static const valueKey = ValueKey('AddStoryScreen');

  const AddStoryScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return AddStoryState();
  }
}

class AddStoryState extends ConsumerState<AddStoryScreen> {
  @override
  Widget build(BuildContext context) {
    final addStoryValNotifier =
        ref.read(AddStoryValueNotifier.provider.notifier);
    final addStoryValState = ref.watch(AddStoryValueNotifier.provider);
    final addStoryState = ref.watch(AddStoryNotifier.provider);
    final addStoryNotifier = ref.watch(AddStoryNotifier.provider.notifier);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Story'),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Expanded(
                  flex: 2,
                  child: addStoryValState.imagePathExists
                      ? _showImage(addStoryValState.imagePath!)
                      : Container(
                          decoration: BoxDecoration(
                            color: Theme.of(context).primaryColor,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Icon(
                              Icons.image,
                              size: 100,
                              color: Colors.white,
                            ),
                          ),
                        ),
                ),
                if (addStoryValState.isImageError)
                  Text(
                    addStoryValState.messageImageError,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                const SizedBox(height: 8),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: addStoryState.isLoading
                            ? null
                            : () {
                                _onGalleryView(
                                  (file) {
                                    if (file == null) return;
                                    addStoryValNotifier.setImageFile(file);
                                  },
                                );
                              },
                        child: const Text('Gallery'),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: addStoryState.isLoading
                            ? null
                            : () async {
                                final cameras = await availableCameras();
                                addStoryNotifier.navigateToCamera(cameras);

                                final image =
                                    await addStoryValNotifier.waitForResult();
                                addStoryValNotifier.setImageFile(image);
                              },
                        child: const Text('Camera'),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),
                const Text(
                  'Description',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                TextField(
                  enabled: !addStoryState.isLoading,
                  decoration: const InputDecoration(
                    hintText: "Enter description",
                  ),
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.multiline,
                  maxLines: 3,
                  onChanged: addStoryValNotifier.onDescriptionOnChanged,
                ),
                if (addStoryValState.isDescError)
                  Text(
                    addStoryValState.messageDescError,
                    style: const TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                    ),
                  ),
                const SizedBox(height: 8),
                ElevatedButton(
                  onPressed: addStoryState.isLoading
                      ? null
                      : () {
                          addStoryValNotifier
                              .onButtonAddPressed((file, description) {
                            addStoryNotifier.addStory(file, description);
                          });
                        },
                  child: const Text("Add"),
                ),
              ],
            ),
          ),
          if (addStoryState.isLoading)
            const Align(
              alignment: Alignment.center,
              child: CircularProgressIndicator(),
            )
        ],
      ),
    );
  }

  Widget _showImage(String imagePath) {
    return Image.file(
      File(imagePath),
      fit: BoxFit.contain,
    );
  }

  _onGalleryView(Function(XFile?) callback) async {
    final ImagePicker picker = ImagePicker();

    final XFile? pickedFile = await picker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 50,
    );

    callback.call(pickedFile);
  }
}
