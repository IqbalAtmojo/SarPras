import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../login/views/login_view.dart';
import '../../register/views/register_view.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 3),
            Container(
              width: 330,
              height: 130,
              child: Image.asset("assets/logo/teksLogo.png"),
            ),
            SizedBox(height: 10),
            _buildStyledButton(
              label: 'Login',
              onPressed: () => Get.to(() => LoginView()),
            ),
            SizedBox(height: 15),
            _buildStyledButton(
              label: 'Register',
              onPressed: () => Get.to(() => RegisterView()),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }

  Widget _buildStyledButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: 180,
      height: 40,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF00B4D8),
          elevation: 5,
          shadowColor: Color(0xFF00B4D8).withOpacity(0.4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25),
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            color: Colors.white, // disamakan agar konsisten
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
