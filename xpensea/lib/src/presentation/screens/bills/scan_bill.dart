import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/core/providers/camera_provider.dart';

class CameraPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraState = ref.watch(cameraProvider);
    return Scaffold(
      appBar: AppBar(title: Text("Scan Bill")),
      body: cameraState.controller != null
          ? CameraPreview(cameraState.controller!)
          : cameraState.error != null
              ? Text("Error: ${cameraState.error}")
              : CircularProgressIndicator(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.camera),
        onPressed: () async {
          if (cameraState.controller != null) {
            try {
              final image = await cameraState.controller!.takePicture();
              // Handle captured image
            } catch (e) {
              // Handle error
            }
          }
        },
      ),
    );
  }
}
