import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/presentation/screens/routes/routes.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:motion/motion.dart';

void main() async {
  /// Ensure that Flutter framework is initialized
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize the Motion plugin.
  await Motion.instance.initialize();

  /// Globally set the sensors sampling rate to 60 frames per second.
  Motion.instance.setUpdateInterval(60.fps);

  /// Load environment variables from the .env file
  await dotenv.load(fileName: ".env");

  /// Run the app
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// Initialize the plugin.

    //test token
    // globals.token =
    //     'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJwYXlsb2FkIjp7InJvbGVJZCI6InN1Ym1pdHRlciIsInVzZXJJZCI6IjY2NzExNDA2YmIwZjI3N2MyODk0MWNiNCJ9LCJpYXQiOjE3MTk1NTYwNDB9.iDSztRead_YJta6OuAL2gsrUVwk_cx_ERNZznp7OfaU';
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppPalette.kPrimaryColor,
      ),
      initialRoute: AppRoutes.splash,
      routes: AppRoutes.getRoutes(),
    );
  }
}
