import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home : Scaffold(
        backgroundColor: Color(0xFF00B4D8),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center, // Tengah vertikal
            children: [
              Container(
                width: 300,
                height: 100,
                child: Image.asset("assets/logo/logo-splash.png"),
              ),
              const SizedBox(height: 30,),
              RichText(
                textAlign: TextAlign.center,
                text: const TextSpan(
                  children: [
                    TextSpan(
                      text: "Aplikasi pengelola fasilitas\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        height: 1.6,
                      ),
                    ),
                    TextSpan(
                      text: "SMPN 7 MALANG",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        height: 1.6,
                      ),
                    ),
                  ],
                ),
              ),
            ]
          ),
        ),
      ),
    );
  }
}