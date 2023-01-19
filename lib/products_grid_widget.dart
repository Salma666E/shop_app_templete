import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product_provider.dart';
import 'product_tile_widget.dart';

class ProductsGrid extends StatelessWidget {
  const ProductsGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductsProvider>(context, listen: true);
    final productList = productData.items;
    final productFav = productData.itemFav;
    log('isFavoriteTapped: ${productData.isFavoriteTapped}');
    if (productData.isFavoriteTapped) {
      log('productFav: $productFav');
      return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10, 
        ),
        itemCount: productFav.length,
        itemBuilder: (BuildContext context, int index) {
          print(
              "index is $index ${productFav[index].title} isFavoriteStatus: ${productFav[index].isFavourite}");
          return ChangeNotifierProvider.value(
            value: productFav[index],
            child: const ProductTile(),
          );
        },
      );
    } else {
      return GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: productList.length,
        itemBuilder: (BuildContext context, int index) {
          print(
              "index is $index ${productList[index].title} isFavoriteStatus: ${productList[index].isFavourite}");
          return ChangeNotifierProvider.value(
            value: productList[index],
            child: const ProductTile(),
          );
        },
      );
    }
  }
}
