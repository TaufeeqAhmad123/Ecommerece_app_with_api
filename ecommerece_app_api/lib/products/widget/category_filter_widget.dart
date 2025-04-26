import 'package:ecommerece_app_api/products/controller/product_controller.dart';
import 'package:ecommerece_app_api/products/model/categoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:shimmer/shimmer.dart';

class CategorYFilterWidget extends StatelessWidget {
  const CategorYFilterWidget({super.key, required ProductController controller})
    : _controller = controller;

  final ProductController _controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductController>(
      builder: (controller) {
        return FutureBuilder<List<CategoryModel>>(
          future: _controller.categoryList,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: 8,
                  itemBuilder: (_, __) => Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Container(
                      width: 80,
                      height: 30,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  separatorBuilder: (_, __) => const SizedBox(width: 6),
                ),
              );
            } else if (snapshot.hasError || !snapshot.hasData) {
              return const Text('No categories');
            }

            final categories = ['All', ...snapshot.data!.map((e) => e.name)];

            return SizedBox(
              height: 40,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  final isSelected =
                      _controller.selectedCategory == category.toLowerCase();
                  return Container(
                    margin: const EdgeInsets.all(3),
                    decoration: BoxDecoration(
                      color: isSelected ? Colors.deepPurple : Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextButton(
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 1,
                        ),
                        backgroundColor: isSelected
                            ? Colors.deepPurple
                            : Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () {
                        _controller.fetchcategoryData(category.toLowerCase());
                      },
                      child: Text(
                        category,
                        style: TextStyle(
                          color: isSelected ? Colors.white : Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(width: 2),
              ),
            );
          },
        );
      },
    );
  }
}