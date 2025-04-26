

import 'package:ecommerece_app_api/products/controller/product_controller.dart';
import 'package:ecommerece_app_api/products/controller/search_controller.dart' ;
import 'package:ecommerece_app_api/products/controller/search_controller.dart' as custom;
import 'package:ecommerece_app_api/products/model/product_model.dart';
import 'package:ecommerece_app_api/products/screen/detail_screen.dart';
import 'package:ecommerece_app_api/products/utils/shimmer_widget.dart';
import 'package:ecommerece_app_api/products/widget/category_filter_widget.dart';
import 'package:ecommerece_app_api/products/widget/product_card.dart';
import 'package:ecommerece_app_api/products/widget/searcch_field.dart';
import 'package:ecommerece_app_api/products/widget/search_result_eidget.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProductListScreen extends StatelessWidget {
  const ProductListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final _searchController = Get.put(custom.SearchController());

    final _controller = Get.put(ProductController());
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Row(
          children: [
            const Text("Products"),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, '/search');
              },
              icon: const Icon(CupertinoIcons.search),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Obx(() {
            final isSearching = _searchController.isSearching.value;

            return Column(
              children: [
                const SizedBox(height: 16),

                // 🔍 Search bar
                searchField(searchController: _searchController),
                const SizedBox(height: 8),

                // 🔎 Search results
                if (isSearching)
                  searchresultWidget(searchController: _searchController)
                else
                  Expanded(
                    child: Column(
                      children: [
                        // 🎯 Static Banner
                      //  BannerWidget(controller: _controller),

                        // 🧭 Category Filters
                        CategorYFilterWidget(controller: _controller),

                        const SizedBox(height: 16),

                        // 🛍 Product Grid
                        Expanded(
                          child: GetBuilder<ProductController>(
                            builder: (controller) {
                              return FutureBuilder<ProductModel>(
                                future: _controller.productFuture,
                                builder: (context, snapshot) {
                                  if (snapshot.connectionState ==
                                      ConnectionState.waiting) {
                                    return CustomShimmer(
                                      type: ShimmerType.grid,
                                      itemCount: 10,
                                    );
                                  } else if (snapshot.hasError ||
                                      !snapshot.hasData) {
                                    return const Center(
                                      child: Text("No products found."),
                                    );
                                  }

                                  final products = snapshot.data!.products;
                                  return GridView.builder(
                                    itemCount: products.length,
                                    gridDelegate:
                                        const SliverGridDelegateWithMaxCrossAxisExtent(
                                          maxCrossAxisExtent: 200,
                                          childAspectRatio: 0.76,
                                          mainAxisSpacing: 9,
                                          crossAxisSpacing: 9,
                                        ),
                                    itemBuilder: (context, index) {
                                      final data = products[index];
                                      return Padding(
                                        padding: const EdgeInsets.only(left: 10,right: 10),
                                        child: ProductCard(
                                          product: data,
                                          onPress: () {
                                            Get.to(DetailScreen(product: data));
                                          },
                                        ),
                                      );
                                    },
                                  );
                                },
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
