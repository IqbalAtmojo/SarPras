import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/riwayat_controller.dart';
import '../../notif/views/notif_view.dart';
import 'package:k/app/widgets/navbar.dart';

class RiwayatView extends GetView<RiwayatController> {
  RiwayatView({super.key});
  
  final RxInt selectedFilterIndex = 0.obs;
  
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
                    padding: EdgeInsets.fromLTRB(45, 30, 20, 15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Text(
                            'Riwayat Peminjaman',
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
                SizedBox(height: 40),
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
                      _buildFilterTabs(),
                      
                      SizedBox(height: 20),
                      
                      // Riwayat List
                      _buildRiwayatList(),
                      
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
  
  Widget _buildFilterTabs() {
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
          _buildFilterTab('Semua', 0),
          _buildFilterTab('Disetujui', 1),
          _buildFilterTab('Ditolak', 2),
        ],
      ),
    ));
  }
  
  Widget _buildFilterTab(String title, int index) {
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
  
  Widget _buildRiwayatList() {
    final List<Map<String, dynamic>> riwayatData = [
      {
        'tanggal': '20 Mei 2025, 10:00',
        'fasilitas': 'Aula',
        'status': 'Ditolak',
        'alasan': 'Rapat',
      },
      {
        'tanggal': '18 Mei 2025, 10:00',
        'fasilitas': 'Kabel VGA to HDMI',
        'status': 'Disetujui',
        'alasan': 'Presentasi tugas agama',
      },
      {
        'tanggal': '15 Mei 2025, 09:00',
        'fasilitas': 'Obeng',
        'status': 'Disetujui',
        'alasan': 'Memperbaiki arduino',
      },
    ];
    
    return Obx(() {
      List<Map<String, dynamic>> filteredData = riwayatData;
      
      if (selectedFilterIndex.value == 1) {
        filteredData = riwayatData.where((item) => item['status'] == 'Disetujui').toList();
      } else if (selectedFilterIndex.value == 2) {
        filteredData = riwayatData.where((item) => item['status'] == 'Ditolak').toList();
      }
      
      return Column(
        children: filteredData.map((data) => _buildRiwayatCard(data)).toList(),
      );
    });
  }
  
  Widget _buildRiwayatCard(Map<String, dynamic> data) {
    Color statusColor = data['status'] == 'Disetujui' 
        ? Colors.green 
        : data['status'] == 'Ditolak' 
            ? Colors.red 
            : Colors.orange;
    
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Color(0xFFCAF0F8),
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 8,
            offset: Offset(0, 4),
            spreadRadius: 0,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header with status
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                data['fasilitas'],
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                decoration: BoxDecoration(
                  color: statusColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: statusColor, width: 1),
                ),
                child: Text(
                  data['status'],
                  style: TextStyle(
                    color: statusColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
            ],
          ),
          
          SizedBox(height: 12),
          
          // Tanggal dan Waktu
          _buildDetailRow(
            icon: Icons.calendar_today_outlined,
            label: 'Tanggal & Waktu',
            value: data['tanggal'],
          ),
          
          SizedBox(height: 8),
          
          // Alasan
          _buildDetailRow(
            icon: Icons.description_outlined,
            label: 'Alasan',
            value: data['alasan'],
            isMultiline: true,
          ),
        ],
      ),
    );
  }
  
  Widget _buildDetailRow({
    required IconData icon,
    required String label,
    required String value,
    bool isMultiline = false,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          color: Color(0xFF00B4D8),
          size: 18,
        ),
        SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[600],
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black87,
                  fontWeight: FontWeight.w500,
                ),
                maxLines: isMultiline ? null : 1,
                overflow: isMultiline ? null : TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ],
    );
  }
}