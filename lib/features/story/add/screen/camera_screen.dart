import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:dicoding_story_app/features/story/add/state/add_story_value_notifier.dart';
import 'package:dicoding_story_app/main/main_notifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CameraScreen extends ConsumerStatefulWidget {
  static const valueKey = ValueKey('CameraScreen');

  const CameraScreen({
    super.key,
  });

  @override
  ConsumerState<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends ConsumerState<CameraScreen>
    with WidgetsBindingObserver {
  CameraController? controller;
  bool _isCameraInitialized = false;
  bool _isBackCameraSelected = true;

  @override
  void initState() {
    final cameras = ref.read(MainNotifier.provider).cameras;
    if (cameras == null) return;

    WidgetsBinding.instance.addObserver(this);

    onNewCameraSelected(cameras.first);

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);

    controller?.dispose();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    final CameraController? cameraController = controller;

    // App state changed before we got the chance to initialize.
    if (cameraController == null || !cameraController.value.isInitialized) {
      return;
    }

    if (state == AppLifecycleState.inactive) {
      // Free up memory when camera not active
      cameraController.dispose();
    } else if (state == AppLifecycleState.resumed) {
      // Reinitialize the camera with same properties
      onNewCameraSelected(cameraController.description);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Take Picture"),
        actions: [
          IconButton(
            onPressed: () => _onCameraSwitch(),
            icon: const Icon(Icons.cameraswitch),
          ),
        ],
      ),
      body: Stack(
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          _isCameraInitialized
              ? CameraPreview(controller!)
              : const Center(child: CircularProgressIndicator()),
          Align(
            alignment: const Alignment(0, 0.95),
            child: _actionWidget(),
          ),
        ],
      ),
    );
  }

  Widget _actionWidget() {
    return FloatingActionButton(
      heroTag: "take-picture",
      tooltip: "Take Picture",
      onPressed: () => _onCameraButtonClick(),
      child: const Icon(Icons.camera_alt),
    );
  }

  Future<void> _onCameraButtonClick() async {
    final image = await controller?.takePicture();
    ref.read(AddStoryValueNotifier.provider.notifier).returnData(image);
    ref.read(MainNotifier.provider.notifier).onPop();
  }

  void _onCameraSwitch() {
    final cameras = ref.read(MainNotifier.provider).cameras;

    if (cameras == null) return;

    if (cameras.length == 1) return;

    setState(() {
      _isCameraInitialized = false;
    });

    onNewCameraSelected(
      cameras[_isBackCameraSelected ? 1 : 0],
    );

    setState(() {
      _isBackCameraSelected = !_isBackCameraSelected;
    });
  }

  void onNewCameraSelected(CameraDescription cameraDescription) async {
    final previousCameraController = controller;
    final cameraController = CameraController(
      cameraDescription,
      ResolutionPreset.low,
      enableAudio: false,
    );

    await previousCameraController?.dispose();

    try {
      await cameraController.initialize();
    } on CameraException catch (e) {
      log('camera: Error initializing camera: $e');
    }

    if (mounted) {
      setState(() {
        controller = cameraController;
        _isCameraInitialized = controller!.value.isInitialized;
      });
    }
  }
}
