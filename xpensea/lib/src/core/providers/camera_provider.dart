import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cameraProvider = StateNotifierProvider<CameraNotifier, CameraState>(
  (ref) => CameraNotifier(),
);

class CameraNotifier extends StateNotifier<CameraState> {
  CameraNotifier() : super(CameraState.initial()) {
    _initializeCamera();
  }

  Future<void> _initializeCamera() async {
    try {
      final cameras = await availableCameras();
      final firstCamera = cameras.firstWhere(
        (camera) => camera.lensDirection == CameraLensDirection.back,
      );
      final cameraController = CameraController(
        firstCamera,
        ResolutionPreset.medium,
      );
      await cameraController.initialize();
      state = CameraState.ready(cameraController);
    } catch (e) {
      state = CameraState.error(e.toString());
    }
  }

  @override
  void dispose() {
    state.controller?.dispose();
    super.dispose();
  }
}

class CameraState {
  final CameraController? controller;
  final String? error;

  CameraState._(this.controller, this.error);

  factory CameraState.initial() => CameraState._(null, null);
  factory CameraState.ready(CameraController controller) =>
      CameraState._(controller, null);
  factory CameraState.error(String error) => CameraState._(null, error);
}
