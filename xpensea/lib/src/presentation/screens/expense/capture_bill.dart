import 'dart:developer';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:xpensea/src/core/providers/camera_provider.dart';
import 'package:xpensea/src/core/theme/text_style.dart';
import 'package:xpensea/src/data/repos/globals.dart';
import 'package:xpensea/src/data/repos/location.dart';
import 'package:xpensea/src/data/routes/user_api_routes.dart';
import 'package:xpensea/src/presentation/components/icons/app_icons.dart';
import 'package:xpensea/src/presentation/screens/events/create_event.dart';
import 'package:xpensea/src/presentation/screens/expense/create_expense.dart';
import 'dart:io';
import 'package:minio_flutter/io.dart';
import 'package:minio_flutter/minio.dart';
import 'package:lottie/lottie.dart';

class CaptureBillPage extends ConsumerWidget {
  const CaptureBillPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Minio.init(
      endPoint: 's3.amazonaws.com',
      accessKey: dotenv.env['AWS_ACCESS_KEY_ID']!,
      secretKey: dotenv.env['AWS_SECRET_ACCESS_KEY']!,
      region: 'ap-south-1',
    );
    final cameraState = ref.watch(cameraProvider);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
                  const Text(
                    'Capture Bill',
                    style: AppTextStyle.kDisplayTitleM,
                  ),
                  GestureDetector(child: SvgPicture.asset(AppIcons.flashOff)),
                ],
              ),
              const SizedBox(
                height: 8,
              ),
              const Divider(),
              const SizedBox(
                height: 40,
              ),
              cameraState.controller != null
                  ? AspectRatio(
                      aspectRatio:
                          1 / cameraState.controller!.value.aspectRatio,
                      child: Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8)),
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: CameraPreview(cameraState.controller!)),
                      ),
                    )
                  : cameraState.error != null
                      ? Text("Error: ${cameraState.error}")
                      : const CircularProgressIndicator(),
              const Spacer(),
              const Text(
                'Tap the button to\ncapture the bill',
                style: AppTextStyle.kDisplayTitleM,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              GestureDetector(
                onTap: () async {
                  if (cameraState.controller != null) {
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) => Center(
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(12),
                          ),
                          width: 320,
                          height: 320,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Lottie.asset('assets/lottie/loader.json'),
                            ],
                          ),
                        ),
                      ),
                    );

                    try {
                      final image = await cameraState.controller!.takePicture();
                      // Handle captured image
                      await Minio.shared
                          .fPutObject('xpensea', image.name, image.path);
                      print("https://xpensea.s3.ap-south-1.amazonaws.com/" +
                          image.name);
                      imageUrl =
                          "https://xpensea.s3.ap-south-1.amazonaws.com/" +
                              image.name;

                      // Determine location
                      location = await determinePosition();

                      //TODO send image to OAI API
                      final response =
                          await ApiService().getImageAnalysis(imageUrl, token);

                      log(response['data']['data']['isExpenseBill'].toString());

                      if (response['data']['data']['isExpenseBill'] == true) {
                        Navigator.pop(context); // Close the loading dialog
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return CreateExpense();
                        }));
                      } else {
                        Navigator.pop(context); // Close the loading dialog
                        showDialog(
                          context: context,
                          builder: (context) => AlertDialog(
                            title: const Text('Error'),
                            content: Text('The image is not a bill'),
                            actions: [
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                child: const Text('Retry'),
                              ),
                              TextButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return CreateEvent();
                                  }));
                                },
                                child: const Text('Continue with this'),
                              ),
                            ],
                          ),
                        );
                      }
                      // Navigator.pop(context); // Close the loading dialog
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) {
                      //   return CreateExpense();
                      // }));
                    } catch (e) {
                      Navigator.pop(
                          context); // Close the loading dialog in case of error
                      showDialog(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Error'),
                          content: Text('An error occurred: $e'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('OK'),
                            ),
                          ],
                        ),
                      );
                    }
                  }
                },
                child: SvgPicture.asset(AppIcons.captureIcon),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
