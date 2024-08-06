import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:xpensea/src/core/theme/palette.dart';
import 'package:xpensea/src/presentation/routes/routes.dart';
import 'package:xpensea/src/data/repos/globals.dart' as globals;
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
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
