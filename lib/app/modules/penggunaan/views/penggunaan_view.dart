import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penggunaan_controller.dart';
import '../../beranda/views/beranda_view.dart';
import '../../profil/views/profil_view.dart';
import '../../notif/views/notif_view.dart';

class PenggunaanView extends GetView<PenggunaanController> {
  const PenggunaanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00B4D8),
      body: Column(
        children: [
          Container(
            color: Color(0xFF00B4D8),
            child: Column(
              children: [
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
                                  'Status Penggunaan',
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
                      SizedBox(height: 70),

              ],
            ),
          ),
                       Expanded(
                         child: 
                           Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),  
                                  topRight: Radius.circular(30)  
                                  )
                              ),
                              child: 
                       Padding(
                         padding: const EdgeInsets.only(top: 50),
                         child: SingleChildScrollView(
                           child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildTempatCard("assets/img/lapangan.png", "Lapangan Futsal", "Digunakan"),
                                  buildTempatCard("assets/img/aula.jpeg", "Aula", "Tersedia"),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildTempatCard("assets/img/imglab1.jpg", "Lab Komputer 1", "Tersedia"),
                                  buildTempatCard("assets/img/imglab2.jpg", "Lab Komputer 2", "Direservasi"),
                                ],
                              ),
                              SizedBox(height: 25),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  buildTempatCard("assets/img/labipa.jpg", "Lab IPA", "Digunakan"),
                                  buildTempatCard("assets/img/voli.jpg", "Lapangan Voli", "Digunakan"),
                                ],
                              ),
                              SizedBox(height: 25),
                            ],
                          ),
                         ),
                       ),

                            ),
                       ), 
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,

                      ),
                      child: 
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
                                isSelected: true,
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
                                isSelected: false,
                                onTap: () {
                                  Get.to(() => ProfilView());
                                },
                              ),
                            ],
                          ),
                        ),
                      
                    ),
        ],
                    
      ),
    );
  }
}


Widget buildTempatCard(String imagePath, String namaTempat, String status) {
  return Container(
    width: 150,
    padding: EdgeInsets.all(8),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 6,
          offset: Offset(0, 3),
        ),
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(
            imagePath,
            height: 80,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
        SizedBox(height: 8),
        Text(
          namaTempat,
          textAlign: TextAlign.center,
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Status: ',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              TextSpan(text: status),
            ],
          ),
          textAlign: TextAlign.center,
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