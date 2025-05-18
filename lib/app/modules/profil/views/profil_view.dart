import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/profil_controller.dart';
import '../../beranda/views/beranda_view.dart';
import '../../penggunaan/views/penggunaan_view.dart';
import '../../home/views/home_view.dart';
import '../../editprofil/views/editprofil_view.dart';
import '../../notif/views/notif_view.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({super.key});
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
                  SizedBox(height: 10),
                  
                  // Name and NISN
                  Text(
                    'Ekasandi Iqbal Atmojo',
                    style: TextStyle(
                      fontSize: 18,
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
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '0084269639',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  
                  SizedBox(height: 40),
                  
                  // Edit Profile Button
                  _buildProfileOption(
                    icon: Icons.person,
                    label: 'Edit Profil',
                    onTap: () {
                      Get.to(() => EditprofilView());
                    },
                  ),
                  
                  SizedBox(height: 25),
                  
                  // Logout Button
                  _buildProfileOption(
                    icon: Icons.logout,
                    label: 'Logout',
                    onTap: () {
                      Get.offAll(() => HomeView());
                    },
                  ),
                  Spacer(),
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
  

  
  Widget _buildProfileOption({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin:  EdgeInsets.symmetric(horizontal: 50),
        child: Row(
          children: [
            // Circular icon
            Container(
              padding:  EdgeInsets.all(12),
              decoration: BoxDecoration(
                color:  Color(0xFF00B4D8),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 24,
              ),
            ),
             SizedBox(width: 20),
            // Label
            Text(
              label,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
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