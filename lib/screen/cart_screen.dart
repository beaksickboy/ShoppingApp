import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app/providers/cart.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<Cart>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text('Total'),
                  Spacer(),
                  Chip(
                    label: Text('\$${cart.totalPrice.toString()}'),
                  ),
                  FlatButton(
                    onPressed: () {},
                    child: Text('Order Now'),
                  ),
                  
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
