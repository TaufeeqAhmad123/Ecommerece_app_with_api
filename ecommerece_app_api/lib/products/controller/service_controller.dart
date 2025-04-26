import 'dart:convert';
import 'dart:io';
import 'dart:math';


import 'package:ecommerece_app_api/products/model/categoryModel.dart';
import 'package:ecommerece_app_api/products/model/product_model.dart';
import 'package:ecommerece_app_api/products/utils/exception.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ServiceController extends GetxController {
  Future<ProductModel> getProducts() async {
    final response = await http.get(
      Uri.parse('https://dummyjson.com/products?limit=100'),
    );
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      final List product = data['products'];

      return ProductModel.fromJson(data);
    } else if (response.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Failed to load services');
    }
  }

  Future<ProductModel> getSearchedItem(String query) async {
    try {
      final reposnse = await http.get(
        Uri.parse('https://dummyjson.com/products/search?q=$query'),
      );
      if (reposnse.statusCode == 200) {
        var data = jsonDecode(reposnse.body);

        return ProductModel.fromJson(data);
      } else if (reposnse.statusCode == 404) {
        throw HttpException("Resource not found (404)");
      } else {
        throw Exception('Failed to load services');
      }
    } catch (e) {
      throw getFriendlyErrorMessage(e);
    }
  }

  Future<List<CategoryModel>> getCategory() async {
    try {
      final reposnse = await http.get(
        Uri.parse('https://dummyjson.com/products/categories'),
      );
      if (reposnse.statusCode == 200) {
        var data = jsonDecode(reposnse.body);
        if (kDebugMode) print(data);
        List<CategoryModel> categories = [];

        for (var item in data) {
          categories.add(CategoryModel.fromJson(item));
        }
        return categories;
      } else if (reposnse.statusCode == 404) {
        throw Exception('Not Found');
      } else {
        throw Exception('Failed to load services');
      }
    } on SocketException {
     
      if (kDebugMode) {
        print("No internet connection. Please check your network again.");
      }
    
      
    } on HttpException catch (e) {
      if (kDebugMode) {
        print("Http error: ${e.message}");
      }
    } on FormatException {
      if (kDebugMode) {
        print("Bad response format");
      }
    } catch (e) {
      throw getFriendlyErrorMessage(e);
    }
    throw Exception('Unexpected error occurred while fetching categories.');
  }

  Future<ProductModel> getCategoryProduct(String category) async {
    final reposnse = await http.get(
      Uri.parse('https://dummyjson.com/products/category/$category'),
    );
    if (reposnse.statusCode == 200) {
      var data = jsonDecode(reposnse.body);

      return ProductModel.fromJson(data);
    } else if (reposnse.statusCode == 404) {
      throw Exception('Not Found');
    } else {
      throw Exception('Failed to load services');
    }
  }
}
