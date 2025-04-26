import 'package:ecommerece_app_api/products/controller/product_controller.dart';
import 'package:ecommerece_app_api/products/model/product_model.dart';

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class BannerWidget extends StatelessWidget {
  const BannerWidget({super.key, required ProductController controller})
    : _controller = controller;

  final ProductController _controller;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ProductModel>(
      future: _controller.banner,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade100,
            child: Container(
              height: 200,
              margin: const EdgeInsets.symmetric(vertical: 16),
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
          );
        } else if (snapshot.hasError ||
            !snapshot.hasData ||
            snapshot.data!.products.isEmpty) {
          return const SizedBox();
        }

        final product = snapshot.data!.products.first;

        return Container(
          height: 200,
          margin: const EdgeInsets.symmetric(vertical: 16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.grey.shade300,
            image: DecorationImage(
              image: NetworkImage(product.images[0]),
              fit: BoxFit.cover,
            ),
          ),
        );
      },
    );
  }
}