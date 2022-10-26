import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/products_grid.dart';
import '../widgets/badge.dart';
import '../screens/cart_screen.dart';
import '../providers/cart_provider.dart';

class ProductsOverviewScreen extends StatelessWidget {
  const ProductsOverviewScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picture Store'),
        centerTitle: true,
        actions: [
          Consumer<CartProvider>(
            builder: (context, value, child) {
              return Badge(
                color: Colors.amber,
                value: value.itemsQty.toString(),
                child: IconButton(
                  icon: const Icon(Icons.shopping_cart),
                  onPressed: () {
                    Navigator.of(context).pushNamed(
                      CartScreen.routeName,
                    );
                  },
                ),
              );
            },
          ),
          const SizedBox(
            width: 10,
          )
        ],
      ),
      body: ProductsGrid(),
    );
  }
}
