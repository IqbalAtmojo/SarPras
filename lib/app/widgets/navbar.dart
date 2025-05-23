import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'bottom_nav_controller.dart';

import '../modules/beranda/views/beranda_view.dart';
import '../modules/profil/views/profil_view.dart';
import '../modules/penggunaan/views/penggunaan_view.dart';

class CustomBottomNavBar extends StatelessWidget {
  final BottomNavController controller = Get.put(BottomNavController());
  CustomBottomNavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(() => Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Container(
            height: 75,
            decoration: BoxDecoration(
              color: const Color(0xFFCAF0F8),
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
                topRight: Radius.circular(50),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                buildNavItem(
                  iconlnk: 'assets/icon/home.png',
                  isSelected: controller.selectedIndex.value == 1,
                  label: 'Beranda',
                  onTap: () {
                    controller.changeIndex(1);
                    Get.to(() => BerandaView());
                  },
                ),
                buildNavItem(
                  iconlnk: 'assets/icon/icon-park-outline_schedule.png',
                  isSelected: controller.selectedIndex.value == 0,
                  label: 'Fasilitas',
                  onTap: () {
                    controller.changeIndex(0);
                    Get.to(() => PenggunaanView());
                  },
                ),
                buildNavItem(
                  iconlnk: 'assets/icon/riwayat.png',
                  isSelected: controller.selectedIndex.value == 3,
                  label: 'Riwayat',
                  onTap: () {
                    controller.changeIndex(3);
                    Get.to(() => PenggunaanView());
                  },
                ),
                buildNavItem(
                  iconlnk: 'assets/icon/profil.png',
                  isSelected: controller.selectedIndex.value == 2,
                  label: 'Profil',
                  onTap: () {
                    controller.changeIndex(2);
                    Get.to(() => ProfilView());
                  },
                ),
              ],
            ),
          ),
    ));
  }

  Widget buildNavItem({
    required String iconlnk,
    required bool isSelected,
    required String label,
    required VoidCallback onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 60,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[ Image.asset(
            iconlnk,
            width: 25,
            height: 25,
            color: isSelected ? Color(0xFF0077B6) : Colors.black,
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 12,
              color: isSelected ? Color(0xFF0077B6) : Colors.black,
            ),
          )
          ],
        ),
      ),
    );
  }
}
