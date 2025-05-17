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
      appBar: AppBar(
        title: null,
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 2),            
            Container(
              width: 330,
              height: 130,
              child: Image.asset("assets/logo/teksLogo.png"),
            ),
            SizedBox(height: 10), // Add spacing between logo and buttons
            Container(
              width: 180, // Width matching the button in the image
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => LoginView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF00B4D8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Highly rounded corners
                  ),
                ),
                child: Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15), // Spacing between buttons
            Container(
              width: 180, // Width matching the button in the image
              height: 40,
              child: ElevatedButton(
                onPressed: () {
                  Get.to(() => RegisterView());
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF48CAE4), // Light turquoise color (#48CAE4)
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25), // Highly rounded corners
                  ),
                ),
                child: Text(
                  'Register',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
            Spacer(flex: 3),
          ],
        ),
      ),
    );
  }
}