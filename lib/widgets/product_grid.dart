import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/products.dart';
import 'package:shop_app/widgets/product_item.dart';

class ProductGrid extends StatelessWidget {
  final filterFavorite;

  ProductGrid(this.filterFavorite);

  @override
  Widget build(BuildContext context) {
    // Rebuild widget when Products change
    final productListener = Provider.of<Products>(context);
    final products = filterFavorite ? productListener.favoriteItems : productListener.items;
    
    return GridView.builder(
      padding: const EdgeInsets.all(10.0),
      itemCount: products.length,
      itemBuilder: (ctx, index) {
        final product = products[index];
        // The default constructor (builder) should be used only to create an object, not to use an existing instance.
        return ChangeNotifierProvider.value(
          value: product,
          child: ProductItem(),
        );
      },
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
    );
  }
}
