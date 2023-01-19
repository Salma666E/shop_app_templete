import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'product.dart';
import 'product_detail_screen.dart';
import 'product_provider.dart';

class ProductTile extends StatelessWidget {
  const ProductTile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context);
    final provider = Provider.of<ProductsProvider>(context, listen: false);
    return ClipRRect(
      borderRadius: BorderRadius.circular(8.0),
      child: InkWell(
        onTap: () {
          Navigator.of(context).pushNamed(
            ProductDetailScreen.routeName,
            arguments: product.id,
          );
        },
        child: GridTile(
          child: Hero(
            tag: product.imageUrl,
            child: Image.network(
              product.imageUrl,
              fit: BoxFit.fitWidth,
            ),
          ),
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: Icon(
                  product.isFavourite ? Icons.favorite : Icons.favorite_border),
              color: Theme.of(context).accentColor,
              onPressed: () {
                log('product.isFavourite: ${product.isFavourite}');
                product.isFavourite
                    ? provider.removeItemFav(product)
                    : provider.addItemFav(product);
                product.toggleFavorite();
              },
            ),
            title: Text(
              product.title,
              textAlign: TextAlign.center,
            ),
            trailing: IconButton(
              icon: const Icon(Icons.shopping_cart),
              onPressed: () {},
            ),
          ),
        ),
      ),
    );
  }
}
