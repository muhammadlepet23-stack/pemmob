import 'dart:async';
import 'package:flutter/material.dart';
import 'dashboard.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Navigasi otomatis ke Dashboard setelah 3 detik
    Timer(const Duration(seconds: 3), () {
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) => const Dashboard()));
    });
  }

  @override
  Widget build(BuildContext context) {
    // Warna gradien
    const Color darkPurple = Color(0xFF3B3B5B);
    const Color brightPurple = Color(0xFF887CFF);

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [darkPurple, brightPurple],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Foto profil bulat
                ClipOval(child: Image.asset('assets/images/profile.jpg', width: 120, height: 120, fit: BoxFit.cover)),
                const SizedBox(height: 20),

                // Nama dan NIM
                const Text(
                  'Muhammad Daffa Hafizha Aulia',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const Text(
                  'APLIKASI INFORMASI',
                  style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 5),
                const Text(
                  '152023078',
                  style: TextStyle(fontSize: 16, color: Colors.white70, fontStyle: FontStyle.italic),
                ),

                const SizedBox(height: 30),

                // Loading Indicator
                const SizedBox(
                  width: 40,
                  height: 40,
                  child: CircularProgressIndicator(
                    strokeWidth: 3,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    backgroundColor: Colors.white30,
                  ),
                ),

                const SizedBox(height: 15),
                const Text('Memuat...', style: TextStyle(color: Colors.white70, fontSize: 14)),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
