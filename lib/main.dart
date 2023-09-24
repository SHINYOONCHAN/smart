import 'package:smart/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() async {
  Color mainColor = const Color(0xFF181B20);
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then(
        (_) {
      runApp(
        MaterialApp(
          home: Scaffold(
            backgroundColor: mainColor,
            body: const SplashScreen(),
          ),
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: mainColor,
            ),
            fontFamily: 'Pretendard',
            useMaterial3: false,
          ),
          debugShowCheckedModeBanner: false,
        ),
      );

    },
  );
}