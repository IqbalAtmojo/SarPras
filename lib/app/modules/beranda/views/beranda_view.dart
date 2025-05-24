import 'package:flutter/material.dart';
import 'dart:async';
import 'package:get/get.dart';
import 'package:k/app/modules/pelaporan/views/pelaporan_view.dart';
import '../../notif/views/notif_view.dart';
import '../../peminjaman/views/peminjaman_view.dart';
import '../../feedback/views/feedback_view.dart';
import 'package:k/app/widgets/navbar.dart';



class BerandaView extends StatelessWidget {
  const BerandaView({super.key});
@override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF00B4D8), // Turquoise blue background
      body: 
        Column(
          children: [
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
                          color: Colors.white,
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
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        'assets/icon/mdi_google-classroom.png',
                        width: 21,
                        height: 21,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8,),
                      Text(
                        'Total Fasilitas',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  // Kolom angka dan label
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        '1.216',
                        style: TextStyle(
                          fontSize: 21,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
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
                        child: Row(
                          children: [
                            Icon(
                              Icons.widgets,
                              size: 20,
                            ),
                            SizedBox(width: 5),
                            Text(
                              'Fitur',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
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
                            color: Color(0xFF023E8A),
                            onTap: (){
                              Get.to(() => PelaporanView());
                            }
                          ),
                          
                          // Peminjaman Fasilitas
                          fitur(
                            iconPath: 'assets/icon/lineicons_school-bench-1.png',
                            title: 'Peminjaman\nFasilitas',
                            color: Color(0xFF023E8A),
                            onTap: (){
                              Get.to(() => PeminjamanView());
                            }
                          ),
                          
                          // Feedback Aplikasi
                          fitur(
                            iconPath: 'assets/icon/feedback.png',
                            title: 'Feedback\nAplikasi',
                            color: Color(0xFF023E8A),
                            onTap: (){
                              Get.to(() => FeedbackView());
                            }
                          ),
                        ],
                      ),
                      
                      SizedBox(height: 40),
                      
                      // Facilities Section
                      Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Row(
                        children: [
                          Icon(
                            Icons.apartment,
                            size: 20, 
                          ),
                          SizedBox(width: 5),
                          Text(
                            'Fasilitas',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 16),

                      // Facility image
                      GambarSlideshow(),

                      Spacer(),
                    // Bottom Navigation
                    CustomBottomNavBar()

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
  required VoidCallback? onTap,
}) {
  return GestureDetector(
    onTap: onTap, // Jalankan fungsi saat diklik
    child: Container(
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

  final List<String> _imageNames = [
    'Aula',
    'Lapangan',
    'Lab Komputer',
  ];

  late final PageController _pageController;
  int _currentPage = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();

    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage < _imagePaths.length - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      if (mounted) {
        _pageController.animateToPage(
          _currentPage,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: SizedBox(
        height: 160, // tambahkan tinggi untuk menampung teks
        child: PageView.builder(
          controller: _pageController,
          itemCount: _imagePaths.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      _imagePaths[index],
                      height: 110, // tinggi gambar
                      width: double.infinity,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          height: 110,
                          color: Colors.grey[300],
                          child: Center(
                            child: Icon(
                              Icons.image_not_supported,
                              size: 50,
                              color: Colors.grey,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 5),
                  Text(
                    _imageNames[index],
                    style: TextStyle(
                      fontSize: 14, 
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}