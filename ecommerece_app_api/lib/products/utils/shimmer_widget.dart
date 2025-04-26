import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

enum ShimmerType { grid, list,  }

class CustomShimmer extends StatelessWidget {
  int itemCount;
  final ShimmerType type;
  CustomShimmer({super.key, required this.type, required this.itemCount});

  @override
  Widget build(BuildContext context) {
    if (type == ShimmerType.grid) {
      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: itemCount,
        itemBuilder: (context, index) {
          return Shimmer.fromColors(
            baseColor: Colors.grey.shade300,
            highlightColor: Colors.grey.shade300,
            enabled: true,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                const SizedBox(height: 8),
                Container(height: 16, width: 100, color: Colors.white),
                const SizedBox(height: 4),
                Container(
                  height: 14,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadiusDirectional.circular(20),
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 4),
                Container(height: 14, width: 100, color: Colors.white),
                const SizedBox(height: 4),
                Container(height: 14, width: 100, color: Colors.white),
              ],
            ),
          );
        },
      );
    } else {
      return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.black.withAlpha(50),
        enabled: true,
        child: ListView.builder(
          itemCount: itemCount,
          itemBuilder: (context, index) {
            return ListTile(
              leading: Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              title: Container(height: 16, width: 100, color: Colors.white),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Container(height: 14, width: 100, color: Colors.white),
                  const SizedBox(height: 4),
                ],
              ),
            );
          },
        ),
      );
    }
  }
}
