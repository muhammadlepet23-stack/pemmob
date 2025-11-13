import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';

void main() {
  runApp(const UtsApp());
}

class UtsApp extends StatelessWidget {
  const UtsApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aplikasi UTS',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
    );
  }
}
