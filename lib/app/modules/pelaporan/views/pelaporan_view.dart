import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/pelaporan_controller.dart';

import '../../beranda/views/beranda_view.dart';
import '../../notif/views/notif_view.dart';
import 'package:k/app/widgets/navbar.dart';


class PelaporanView extends GetView<PelaporanController> {
  const PelaporanView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                                  'Pelaporan',
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
                      SizedBox(height: 40),

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
                              child: Padding(
                                padding: EdgeInsets.fromLTRB(40, 35, 40, 0),
                                child: SingleChildScrollView(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Nama Pelapor',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        height: 45,
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
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                          ),
                                        ),
                                      ),
                                      
                                      SizedBox(height: 20),
                                      Text(
                                        'Fasilitas yang rusak',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        height: 45,
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
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                          ),
                                        ),
                                      ),
                                      
                                      SizedBox(height: 20),
                                      Text(
                                        'Tempat',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        height: 45,
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
                                          style: TextStyle(
                                            fontSize: 15,
                                          ),
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            contentPadding: EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                                          ),
                                        ),
                                      ),
                                      
                                      SizedBox(height: 20),
                                      Text(
                                        'Gambar',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      SizedBox(height: 8),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(12, 8, 12, 0),
                                        height: 35,
                                        width: 130,
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
                                          child: Text(
                                          'Upload Gambar',
                                          style: TextStyle(
                                            fontSize: 12
                                          ),
                                        ),
                                      ),

                                      SizedBox(height: 50),

                                      Center(
                                      child: Container(
                                        width: 150,
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
                                            'Kirim',
                                            style: TextStyle(
                                              fontSize: 16,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    ],
                                  ),
                                ),
                              ),

                            ),
                       ), 
                    CustomBottomNavBar()
        ],
                    
      ),
    );
  }
}



