import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:shop_app/providers/products.dart';

class ProductDetailScreen extends StatelessWidget {
  static const routeName = '/product-detail';

  @override
  Widget build(BuildContext context) {
    final id = ModalRoute.of(context).settings.arguments as String;
    // Disbale listening for auto rebuild when list of product change
    final product = Provider.of<Products>(context, listen: false).findById(id);

    return Scaffold(
      appBar: AppBar(
        title: Text('title'),
      ),
    );
  }
}
