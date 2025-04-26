
import 'package:ecommerece_app_api/products/controller/service_controller.dart';
import 'package:ecommerece_app_api/products/model/product_model.dart' show Product;
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchController extends GetxController {
  final TextEditingController textController = TextEditingController();
  final services = Get.put(ServiceController());

  var searchResults = <Product>[].obs;
  var isLoading = false.obs;
  var isSearching = false.obs;

  

  void performSearch(String query) async {
    if (query.isEmpty) {
      var isSearching = false.obs;
      searchResults.clear();
      return;
    }
    isLoading.value = true;
    isSearching.value = true;
    try {
      final allProducts = await services.getSearchedItem(query);
      var result = allProducts.products.where((e) {
        return e.title.toLowerCase().contains(query.toLowerCase());
      }).toList();
      searchResults.value = result;
    } catch (e) {
      print('Error: $e');
    } finally {
      isLoading.value = false;
    
    }
  }
}
