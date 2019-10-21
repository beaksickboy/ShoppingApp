import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/product.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screen/product_detail_screen.dart';

class ProductItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Rebuild entire widget
    final product = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<Cart>(context, listen: false);

    return GridTile(
      child: GestureDetector(
        child: Image.network(product.imageUrl),
        onTap: () {
          Navigator.of(context)
              .pushNamed(ProductDetailScreen.routeName, arguments: product.id);
        },
      ),
      footer: GridTileBar(
        backgroundColor: Colors.black54,
        // Rebuild small part in widget
        leading: Consumer<Product>(
          builder: (context, product, child) => IconButton(
            icon: Icon(
                product.isFavorite ? Icons.favorite : Icons.favorite_border),
            onPressed: () {
              product.toggleFavorite();
            },
          ),
        ),
        title: Text(
          product.title,
          textAlign: TextAlign.center,
        ),
        trailing: IconButton(
          icon: Icon(Icons.shopping_cart),
          onPressed: () {
            cart.addItems(product.id, product.price, product.title);
          },
        ),
      ),
    );
  }
}
