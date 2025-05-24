import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:k/app/modules/setting/views/setting_view.dart';

import '../controllers/profil_controller.dart';
import '../../home/views/home_view.dart';
import '../../editprofil/views/editprofil_view.dart';
import '../../notif/views/notif_view.dart';
import 'package:k/app/widgets/navbar.dart';


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
                SafeArea(
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(45, 30, 20, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Profil',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
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

                  _buildProfileOption(
                    icon: Icons.settings,
                    label: 'Setting',
                    onTap: () {
                      Get.to(() => SettingView());
                    },
                  ),
                  
                  SizedBox(height: 25),
                  
                  // Logout Button
                  _buildProfileOption(
                    icon: Icons.logout,
                    label: 'Logout',
                    onTap: () {
                      _showLogoutDialog(context);
                    },
                  ),
                  Spacer(),
                    CustomBottomNavBar()
                ],
              ),
            ),
          ),
         
        ],
      ),
    );
  }
  
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: Colors.orange,
                size: 28,
              ),
              SizedBox(width: 10),
              Text(
                'Konfirmasi Logout',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          content: Text(
            'Apakah Anda yakin ingin keluar dari aplikasi?',
            style: TextStyle(
              fontSize: 16,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text(
                'Batal',
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                Get.offAll(() => HomeView()); // Lakukan logout
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00B4D8),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              ),
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        );
      },
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
