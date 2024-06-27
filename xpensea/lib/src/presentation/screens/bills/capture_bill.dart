import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/providers/camera_provider.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';

class CaptureBillPage extends ConsumerWidget {
  const CaptureBillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cameraState = ref.watch(cameraProvider);
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: SvgPicture.asset(AppIcons.iosBack)),
                Text(
                  'Capture Bill',
                  style: AppTextStyle.kDisplayTitleM,
                ),
                GestureDetector(child: SvgPicture.asset(AppIcons.flashOff)),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(),
            SizedBox(
              height: 40,
            ),
            cameraState.controller != null
                ? Container(
                    height: 400,
                    width: double.infinity,
                    decoration:
                        BoxDecoration(borderRadius: BorderRadius.circular(8)),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: CameraPreview(cameraState.controller!)))
                : cameraState.error != null
                    ? Text("Error: ${cameraState.error}")
                    : CircularProgressIndicator(),
            Spacer(),
            Text(
              'Tap the button to\ncapture the bill',
              style: AppTextStyle.kDisplayTitleM,
              textAlign: TextAlign.center,
            ),
            Spacer(),
            GestureDetector(
                onTap: () async {
                  if (cameraState.controller != null) {
                    try {
                      final image = await cameraState.controller!.takePicture();
                      // Handle captured image
                    } catch (e) {
                      // Handle error
                    }
                  }
                },
                child: SvgPicture.asset(AppIcons.captureIcon)),
          ],
        ),
      )),
    );
  }
}
