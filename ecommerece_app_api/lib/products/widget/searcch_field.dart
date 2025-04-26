
import 'package:ecommerece_app_api/products/controller/search_controller.dart' as custom;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class searchField extends StatelessWidget {
  const searchField({
    super.key,
    required custom.SearchController searchController,
  }) : _searchController = searchController;

  final custom.SearchController _searchController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: TextField(
        controller: _searchController.textController,
        onChanged: _searchController.performSearch,
        decoration: InputDecoration(
          hint: const Text('Search products...'),
          filled: true,
          prefixIcon: const Icon(CupertinoIcons.search),
          suffixIcon: IconButton(
            icon: const Icon(CupertinoIcons.clear_circled),
            onPressed: () {
              _searchController.textController.clear();
              _searchController.searchResults.clear();
              _searchController.isSearching.value = false;
            },
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(12)),
            borderSide: BorderSide(color: Colors.black12, width: 1),
          ),
        ),
      ),
    );
  }
}
