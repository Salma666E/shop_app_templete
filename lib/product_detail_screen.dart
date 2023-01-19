import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_templete/product_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen({Key? key}) : super(key: key);
  static const routeName = '/product-detail';
  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;
    final dataRoom = Provider.of<ProductsProvider>(context);
    final product = dataRoom.findById(productId);
    return Scaffold(
      appBar: AppBar(
        title: Text(product.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              child: Hero(
                tag: product.imageUrl,
                child: Image.network(
                  product.imageUrl,
                  fit: BoxFit.fill,
                  height: MediaQuery.of(context).size.height * 0.4,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: SingleChildScrollView(
                child: Text(
                  product.description,
                  style: const TextStyle(
                      color: Colors.cyan,
                      fontSize: 24,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 8),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${product.price}',
                  style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 24,
                  ),
                ),
                IconButton(
                  icon: Icon(product.isFavourite
                      ? Icons.favorite
                      : Icons.favorite_border),
                  color: Theme.of(context).accentColor,
                  iconSize: 32,
                  onPressed: () {
                    product.isFavourite
                        ? dataRoom.removeItemFav(product)
                        : dataRoom.addItemFav(product);
                    product.toggleFavorite();
                  },
                ),
              ],
            ),
            const SizedBox(height: 16),
            MaterialButton(
              padding: const EdgeInsets.symmetric(vertical: 16),
              color: Colors.cyan,
              textColor: Theme.of(context).accentColor,
              child: const Text(
                'Add to cart',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              onPressed: () {},
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
