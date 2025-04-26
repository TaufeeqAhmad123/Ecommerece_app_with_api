import 'package:ecommerece_app_api/products/controller/search_controller.dart' as custom;
import 'package:ecommerece_app_api/products/utils/shimmer_widget.dart';
import 'package:flutter/material.dart';

class searchresultWidget extends StatelessWidget {
  const searchresultWidget({
    super.key,
    required custom.SearchController searchController,
  }) : _searchController = searchController;

  final custom.SearchController _searchController;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: _searchController.isLoading.value
          ? CustomShimmer(type: ShimmerType.list, itemCount: 8)
          : _searchController.searchResults.isEmpty &&
                _searchController.textController.text.isNotEmpty
          ? const Center(child: Text('No results found'))
          : ListView.builder(
              itemCount: _searchController.searchResults.length,
              itemBuilder: (context, index) {
                final product = _searchController.searchResults[index];
                return ListTile(
                  leading: Image.network(
                    product.thumbnail,
                    width: 50,
                    height: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(product.title),
                  subtitle: Text(product.brand),
                  onTap: () {},
                );
              },
            ),
    );
  }
}
