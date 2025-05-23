import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/notif_controller.dart';
import 'package:k/app/widgets/navbar.dart';


class NotifView extends GetView<NotifController> {
  const NotifView({super.key});
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
                                  'Notifikasi',
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
                      SizedBox(height: 35),

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
                         padding: EdgeInsets.fromLTRB(40, 35, 40, 0),
                         child: SingleChildScrollView(
                           child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Hari Ini',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              NotificationCard(
                                title: 'Kerusakan',
                                description: 'Terdapat kerusakan pada monitor 2 di Lab Komputer 2',
                                iconPath: 'assets/icon/notif.png',
                              ),
                              NotificationCard(
                                title: 'Perbaikan',
                                description: 'Terdapat perbaikan di Masjid lantai 2',
                                iconPath: 'assets/icon/notif.png',
                              ),
                              NotificationCard(
                                title: 'Peminjaman',
                                description: 'Peminjaman Lapangan telah disetujui',
                                iconPath: 'assets/icon/notif.png',
                              ),
                              SizedBox(height: 5),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Text('Kemarin',
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                  )
                                ],
                              ),
                              SizedBox(height: 20),
                              NotificationCard(
                                title: 'Peminjaman',
                                description: 'Peminjaman Aula telah ditolak',
                                iconPath: 'assets/icon/notif.png',
                              ),
                              NotificationCard(
                                title: 'Perbaikan',
                                description: 'Terdapat perbaikan di Ruang 10',
                                iconPath: 'assets/icon/notif.png',
                              ),
                              SizedBox(height: 30),
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


class NotificationCard extends StatelessWidget {
  final String title;
  final String description;
  final String iconPath;

  const NotificationCard({
    Key? key,
    required this.title,
    required this.description,
    required this.iconPath,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                color: Color(0xFFD9D9D9),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Image.asset(iconPath),
            ),

            SizedBox(width: 20),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    description,
                    style: TextStyle(fontSize: 12),
                  ),
                ],
              ),
            ),
          ],
        ),

        SizedBox(height: 15),

        Container(
          width: double.infinity,
          height: 4,
          color: Color(0xFFD9D9D9),
        ),

        SizedBox(height: 15),
      ],
    );
  }
}