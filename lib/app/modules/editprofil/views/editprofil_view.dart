import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k/app/modules/editprofil/controllers/editprofil_controller.dart';

import '../../beranda/views/beranda_view.dart';
import '../../penggunaan/views/penggunaan_view.dart';
import '../../profil/views/profil_view.dart';
import '../../notif/views/notif_view.dart';

class EditprofilView extends GetView<EditprofilController> {
  const EditprofilView({super.key});
 @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFCAF0F8), // Light blue input field
                        borderRadius: BorderRadius.circular(15),
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFCAF0F8), // Light blue input field
                        borderRadius: BorderRadius.circular(15),
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
                        controller: TextEditingController(text: '0084269639'),
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        ),
                      ),
                    ),
                    
                    SizedBox(height: 20),
                    
                    // Password Field
                    Text(
                      'Password',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFCAF0F8), // Light blue input field
                        borderRadius: BorderRadius.circular(15),
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
                        obscureText: true, // For password field
                        controller: TextEditingController(text: '12345'),
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
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8),
                    Container(
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFCAF0F8), // Light blue input field
                        borderRadius: BorderRadius.circular(15),
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
                          controller: TextEditingController(text: '082230130798'),
                          decoration: InputDecoration(
                          border: InputBorder.none,
                          contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    
                    // Register Button
                    Center(
                      child: Container(
                        width: 200,
                        height: 40,
                        child: ElevatedButton(
                          onPressed: () {
                            Get.to(() => BerandaView());
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
                  
                    Container(
                      height: 80,
                      decoration: BoxDecoration(
                        color: Color(0xFFCAF0F8),
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _buildNavItem(
                            iconlnk: 'assets/icon/icon-park-outline_schedule.png',
                            isSelected: false,
                            onTap: () {
                              Get.to(() => PenggunaanView());
                            },
                          ),
                          _buildNavItem(
                            iconlnk: 'assets/icon/home.png',
                            isSelected: false,
                            onTap: () {
                              Get.to(() => BerandaView());
                            },
                          ),
                          _buildNavItem(
                            iconlnk: 'assets/icon/profil.png',
                            isSelected: true,
                            onTap: () {
                              Get.to(() => ProfilView());
                            },
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  }
  

Widget _buildNavItem({
  required String iconlnk,
  required bool isSelected,
  required VoidCallback onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: 50,
      height: 50,
      decoration: BoxDecoration(
        color: isSelected ? Color(0xFF00B4D8) : Colors.transparent,
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      child: Center(
        child: Image.asset(
          iconlnk,
          width: 30,
          height: 30,
          color: isSelected ? Colors.white : Colors.black,
        ),
      ),
    ),
  );
}
}