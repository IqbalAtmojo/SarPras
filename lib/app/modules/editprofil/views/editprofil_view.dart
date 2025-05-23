import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k/app/modules/editprofil/controllers/editprofil_controller.dart';
import 'package:k/app/widgets/navbar.dart';
import '../../profil/views/profil_view.dart';
import '../../notif/views/notif_view.dart';

class EditprofilView extends GetView<EditprofilController> {
  const EditprofilView({super.key});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          // Top Header with profile picture
          Container(
            color: Color(0xFF00B4D8),
            child: Column(
              children: [
                // AppBar section
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            'Profil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                      padding: EdgeInsets.zero,
                      icon: Image.asset(
                        'assets/icon/notif.png',
                        width: 20,
                        height: 20,
                      ),
                      onPressed: () {
                        Get.to(() => NotifView());
                      },
                    ),
                  ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 20),
                
                
                Stack(
                  alignment: Alignment.topCenter,
                  clipBehavior: Clip.none,
                  children: [
                    
                    Container(
                      width: double.infinity,
                      height: 110,
                    ),
                    
                    Positioned(
                      top: 45, // Half of the profile pic will be in the blue area
                      left: 0,
                      right: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(30),
                            topRight: Radius.circular(30),
                          ),
                        ),
                        height: 65,
                      ),
                    ),
                    
                    // Profile picture
                    Positioned(
                      top: 0,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white, width: 3),
                        ),
                        child: CircleAvatar(
                          radius: 45,
                          child: Image.asset(
                            'assets/img/fotoprofil.png',
                            width: 90,
                            height: 90,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Profile information
          Expanded(
            child: Container(
              color: Colors.white,
              width: double.infinity,
              child: Column(
                children: [
                  
                  // Name and NISN
                  Text(
                    'Ekasandi Iqbal Atmojo',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'NISN: ',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '0084269639',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  
                  Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    // Nama Lengkap Field
                    Text(
                      'Nama Lengkap',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFCAF0F8), // Light blue input field
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        controller: TextEditingController(text: 'Ekasandi Iqbal Atmojo'),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    // NISN Field
                    Text(
                      'NISN',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFCAF0F8), // Light blue input field
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15,
                        ),
                        controller: TextEditingController(text: '0084269639'),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    // No. Telepon
                    Text(
                      'No. Telepon',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 40,
                      decoration: BoxDecoration(
                        color: Color(0xFFCAF0F8), // Light blue input field
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.25),
                            blurRadius: 4,
                            offset: Offset(0, 4),
                            spreadRadius: 0,
                          ),
                        ],
                      ),
                      child: TextField(
                        style: TextStyle(
                          fontSize: 15,
                        ),
                          controller: TextEditingController(text: '082230130798'),
                          decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        ),
                      ),
                    ),

                    SizedBox(height: 35),
                    
                    // edit Button
                    Center(
                      child: Container(
                        width: 180,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => ProfilView());
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFF00B4D8), // Turquoise blue button
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            elevation: 2,
                          ),
                          child: Text(
                            'Update Profil',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                  ],
                ),
              ),
            ),
          ),
                  
                    CustomBottomNavBar()
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  }
}