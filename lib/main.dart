import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:k/app/modules/home/views/home_view.dart';
import 'app/widgets/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Aplikasi',
      theme: ThemeData(
        fontFamily: 'Poppins',
      ),
      home: const SplashScreenWrapper(), // mulai dari splash
    );
  }
}

class SplashScreenWrapper extends StatefulWidget {
  const SplashScreenWrapper({super.key});

  @override
  State<SplashScreenWrapper> createState() => _SplashScreenWrapperState();
}

class _SplashScreenWrapperState extends State<SplashScreenWrapper> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () {
      Get.to(
        () => const HomeView(),
        transition: Transition.fade,
        duration: const Duration(milliseconds: 1000),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const SplashScreen(); // hanya splash di awal
  }
}
