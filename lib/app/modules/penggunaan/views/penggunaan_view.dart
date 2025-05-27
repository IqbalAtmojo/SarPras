import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/penggunaan_controller.dart';
import '../../notif/views/notif_view.dart';
import 'package:k/app/widgets/navbar.dart';

class TempatModel {
  final String imagePath;
  final String namaTempat;
  final String status;
  final String kategori; 

  TempatModel({
    required this.imagePath,
    required this.namaTempat,
    required this.status,
    required this.kategori,
  });
}

class PenggunaanView extends GetView<PenggunaanController> {
  const PenggunaanView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<TempatModel> allTempat = [
      TempatModel(
        imagePath: "assets/img/lapangan.png",
        namaTempat: "Lapangan Futsal",
        status: "Digunakan",
        kategori: "Prasarana",
      ),
      TempatModel(
        imagePath: "assets/img/aula.jpeg",
        namaTempat: "Aula",
        status: "Tersedia",
        kategori: "Prasarana",
      ),
      TempatModel(
        imagePath: "assets/img/imglab1.jpg",
        namaTempat: "Lab Komputer 1",
        status: "Tersedia",
        kategori: "Prasarana",
      ),
      TempatModel(
        imagePath: "assets/img/imglab2.jpg",
        namaTempat: "Lab Komputer 2",
        status: "Direservasi",
        kategori: "Prasarana",
      ),
      TempatModel(
        imagePath: "assets/img/labipa.jpg",
        namaTempat: "Lab IPA",
        status: "Digunakan",
        kategori: "Prasarana",
      ),
      TempatModel(
        imagePath: "assets/img/voli.jpg",
        namaTempat: "Lapangan Voli",
        status: "Digunakan",
        kategori: "Prasarana",
      ),
      TempatModel(
        imagePath: "assets/img/proyektor.jpg",
        namaTempat: "Proyektor",
        status: "Tersedia",
        kategori: "Sarana",
      ),
      TempatModel(
        imagePath: "assets/img/speaker.webp",
        namaTempat: "Speaker",
        status: "Tersedia",
        kategori: "Sarana",
      ),
      TempatModel(
        imagePath: "assets/img/mikrofon.jpeg",
        namaTempat: "Mikrofon",
        status: "Tersedia",
        kategori: "Sarana",
      ),
      TempatModel(
        imagePath: "assets/img/vga.jpeg",
        namaTempat: "Kabel VGA to HDMI",
        status: "Tersedia",
        kategori: "Sarana",
      ),
      TempatModel(
        imagePath: "assets/img/obeng.jpeg",
        namaTempat: "Obeng",
        status: "Tersedia",
        kategori: "Sarana",
      ),
    ];

    final RxInt selectedFilterIndex = 0.obs;

    return GetBuilder<PenggunaanController>(
      init: PenggunaanController(),
      builder: (controller) {
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
                        padding: EdgeInsets.fromLTRB(45, 30, 20, 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [              
                            Expanded(
                              child: Text(
                                'Fasilitas',
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
                    // SearchBar Section
                    Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
                      child: Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(25),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black12,
                              blurRadius: 4,
                              offset: Offset(0, 2),
                            ),
                          ],
                        ),
                        child: TextField(
                          onChanged: (value) {
                            controller.updateSearchQuery(value);
                          },
                          decoration: InputDecoration(
                            hintText: 'Cari tempat...',
                            hintStyle: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.grey[600],
                              size: 20,
                            ),
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.symmetric(
                              horizontal: 20,
                              vertical: 12,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.fromLTRB(20, 25, 20, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Filter Tabs
                          _buildFilterTabs(selectedFilterIndex),
                          
                          SizedBox(height: 20),
                          
                          // Content Cards
                          Obx(() {
                            // Filter data berdasarkan kategori yang dipilih
                            List<TempatModel> filteredTempat = allTempat;
                            
                            if (selectedFilterIndex.value == 1) {
                              filteredTempat = allTempat.where((tempat) => tempat.kategori == 'Prasarana').toList();
                            } else if (selectedFilterIndex.value == 2) {
                              filteredTempat = allTempat.where((tempat) => tempat.kategori == 'Sarana').toList();
                            }
                            
                            // Filter berdasarkan search query
                            filteredTempat = filteredTempat.where((tempat) {
                              if (controller.searchQuery.isEmpty) {
                                return true;
                              }
                              return tempat.namaTempat.toLowerCase().contains(
                                controller.searchQuery.toLowerCase(),
                              );
                            }).toList();

                            return filteredTempat.isEmpty
                                ? Center(
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.search_off,
                                          size: 64,
                                          color: Colors.grey[400],
                                        ),
                                        SizedBox(height: 16),
                                        Text(
                                          'Tidak ada tempat ditemukan',
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.grey[600],
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Coba ubah filter atau kata kunci pencarian',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.grey[500],
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: [
                                      for (int i = 0; i < filteredTempat.length; i += 2)
                                        Padding(
                                          padding: EdgeInsets.only(bottom: 25),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                            children: [
                                              buildTempatCard(
                                                filteredTempat[i].imagePath,
                                                filteredTempat[i].namaTempat,
                                                filteredTempat[i].status,
                                              ),
                                              if (i + 1 < filteredTempat.length)
                                                buildTempatCard(
                                                  filteredTempat[i + 1].imagePath,
                                                  filteredTempat[i + 1].namaTempat,
                                                  filteredTempat[i + 1].status,
                                                )
                                              else
                                                Container(width: 150), // Placeholder untuk spacing
                                            ],
                                          ),
                                        ),
                                    ],
                                  );
                          }),
                          
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
      },
    );
  }
  
  Widget _buildFilterTabs(RxInt selectedFilterIndex) {
    return Obx(() => Container(
      height: 45,
      decoration: BoxDecoration(
        color: Color(0xFFCAF0F8),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Row(
        children: [
          _buildFilterTab('Semua', 0, selectedFilterIndex),
          _buildFilterTab('Prasarana', 1, selectedFilterIndex),
          _buildFilterTab('Sarana', 2, selectedFilterIndex),
        ],
      ),
    ));
  }
  
  Widget _buildFilterTab(String title, int index, RxInt selectedFilterIndex) {
    bool isSelected = selectedFilterIndex.value == index;
    
    return Expanded(
      child: GestureDetector(
        onTap: () {
          selectedFilterIndex.value = index;
        },
        child: Container(
          margin: EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: isSelected ? Color(0xFF00B4D8) : Colors.transparent,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Center(
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? Colors.white : Color(0xFF00B4D8),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTempatCard(String imagePath, String namaTempat, String status) {
  // Tentukan warna status berdasarkan status
  Color statusColor;
  switch (status.toLowerCase()) {
    case 'tersedia':
      statusColor = Colors.green;
      break;
    case 'digunakan':
      statusColor = Colors.red;
      break;
    case 'direservasi':
      statusColor = Colors.orange;
      break;
    default:
      statusColor = Colors.grey;
  }

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
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Status: ',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              decoration: BoxDecoration(
                color: statusColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: statusColor, width: 1),
              ),
              child: Text(
                status,
                style: TextStyle(
                  fontSize: 10,
                  color: statusColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    ),
  );
}