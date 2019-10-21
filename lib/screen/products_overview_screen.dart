import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';
import 'package:shop_app/screen/cart_screen.dart';
import 'package:shop_app/widgets/badge.dart';

import 'package:shop_app/widgets/product_grid.dart';

enum FilterOptions {
  Favorite,
  All,
}

class ProductsOverviewScreen extends StatefulWidget {
  @override
  _ProductsOverviewScreenState createState() => _ProductsOverviewScreenState();
}

class _ProductsOverviewScreenState extends State<ProductsOverviewScreen> {
  bool filterFavorite = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shopping Cart'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions option) {
              setState(() {
                if (option == FilterOptions.Favorite) {
                  filterFavorite = true;
                } else if (option == FilterOptions.All) {
                  filterFavorite = false;
                }
              });
            },
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Text('Favorite'),
                value: FilterOptions.Favorite,
              ),
              PopupMenuItem(
                child: Text('All'),
                value: FilterOptions.All,
              ),
            ],
          ),
          Consumer<Cart>(
            builder: (context, cart, constChild) {
              return Badge(
                child: constChild,
                value: cart.itemCount.toString(),
              );
            },
            child: IconButton(
              icon: Icon(Icons.shopping_cart),
              onPressed: () {
                Navigator.of(context).pushNamed(CartScreen.routeName);
              },
            ),
          ),
        ],
      ),
      body: ProductGrid(filterFavorite),
    );
  }
}
