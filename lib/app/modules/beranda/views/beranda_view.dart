import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import '../controllers/beranda_controller.dart';
import '../../profil/views/profil_view.dart';
import '../../penggunaan/views/penggunaan_view.dart';
import '../../notif/views/notif_view.dart';


class BerandaView extends StatelessWidget {
  const BerandaView({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00B4D8), // Turquoise blue background
      body: 
        Column(
          children: [
            // Header with greeting and notification
            Padding(
              padding: const EdgeInsets.fromLTRB(30, 70, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hi, Selamat Datang',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        'Di Aplikasi Pengelolaan Fasilitas\nSMPN 7 MALANG',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 20),
                  child: Container(
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
                  )
                ],
              ),
            ),

            // Total facilities count
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 30),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/mdi_google-classroom.png',
                        width: 24,
                        height: 24,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8,),
                      Text(
                        'Total Fasilitas',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),

                  // Kolom angka dan label
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '1.903',
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            Expanded(
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Filter Section
                      Padding(
                        padding: const EdgeInsets.fromLTRB(30, 25, 0, 0),
                        child: Text(
                          'Fitur',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      // fitur options
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          // Pelaporan Kerusakan
                          fitur(
                            iconPath: 'assets/icon/rusak.png',
                            title: 'Pelaporan\nKerusakan',
                            color: Colors.red,
                          ),
                          
                          // Peminjaman Fasilitas
                          fitur(
                            iconPath: 'assets/icon/lineicons_school-bench-1.png',
                            title: 'Peminjaman\nFasilitas',
                            color: Colors.yellow,
                          ),
                          
                          // Feedback Aplikasi
                          fitur(
                            iconPath: 'assets/icon/feedback.png',
                            title: 'Feedback\nAplikasi',
                            color: Colors.black,
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 40),
                      
                      // Facilities Section
                      Padding(
                        padding: const EdgeInsets.only(left: 30,),
                        child: Text(
                          'Fasilitas',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      
                      // Facility image
                      GambarSlideshow(),

                      Spacer(),
                    // Bottom Navigation
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
                            isSelected: true,
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

                    ],
                  ),
                ),
              ),
                      
          ],
        ),
    );
  }
  
  Widget fitur({
    required String iconPath,
    required String title,
    required Color color,
  }) {
    return Container(
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 50,
            height: 50,
            decoration: BoxDecoration(
              color: Color(0xFFCAF0F8),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Center(
              child: Image.asset( 
              iconPath,
              color: color,
              width: 24,
              height: 24,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            title,
            textAlign: TextAlign.start,
            style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.bold,
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

class GambarSlideshow extends StatefulWidget {
  @override
  _GambarSlideshowState createState() => _GambarSlideshowState();
}

class _GambarSlideshowState extends State<GambarSlideshow> {
  final List<String> _imagePaths = [
    'assets/img/aula.jpeg',
    'assets/img/lapangan.png',
    'assets/img/imglab2.jpg',
  ];

  int _currentIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        _currentIndex = (_currentIndex + 1) % _imagePaths.length;
      });
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          height: 120,
          width: double.infinity,
          child: IndexedStack(
            index: _currentIndex,
            children: _imagePaths.map((path) {
              return Image.asset(
                path,
                fit: BoxFit.cover,
                width: double.infinity,
                errorBuilder: (context, error, stackTrace) {
                  return Center(
                    child: Icon(
                      Icons.image_not_supported,
                      size: 50,
                      color: Colors.grey,
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}