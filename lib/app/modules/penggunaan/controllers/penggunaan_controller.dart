import 'package:get/get.dart';

class PenggunaanController extends GetxController {
  //TODO: Implement PenggunaanController
  String _selectedFilter = 'Semua';
  String get selectedFilter => _selectedFilter;

  // State untuk search query
  String _searchQuery = '';
  String get searchQuery => _searchQuery;

  // Method untuk update filter
  void updateFilter(String filter) {
    _selectedFilter = filter;
    update(); // Trigger rebuild UI
  }

  // Method untuk update search query
  void updateSearchQuery(String query) {
    _searchQuery = query;
    update(); // Trigger rebuild UI
  }

  // Method untuk reset filter
  void resetFilter() {
    _selectedFilter = 'Semua';
    _searchQuery = '';
    update();
  }

  @override
  void onInit() {
    super.onInit();
    // Initialize default values if needed
  }

  @override
  void onClose() {
    // Clean up when controller is disposed
    super.onClose();
  }
  final count = 0.obs;

  @override
  void onReady() {
    super.onReady();
  }

  void increment() => count.value++;
}
