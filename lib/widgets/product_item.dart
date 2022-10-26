import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../screens/product_detail_screen.dart';
import '../models/product.dart';
import '../providers/cart_provider.dart';

class ProductItem extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    final productItem = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Color.fromARGB(221, 4, 45, 37),
          leading: Consumer<Product>(
            builder: (context, value, child) => IconButton(
              icon: productItem.isFavorite
                  ? const Icon(
                      Icons.favorite,
                      size: 20,
                    )
                  : const Icon(
                      Icons.favorite_border_outlined,
                      size: 20,
                    ),
              color: Theme.of(context).colorScheme.secondary,
              onPressed: () {
                productItem.statusFav();
              },
            ),
          ),
          title: Text(
            productItem.title,
            textAlign: TextAlign.center,
          ),
          trailing: IconButton(
            icon: const Icon(
              Icons.shopping_cart,
              size: 20,
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('${productItem.title} ditambahkan ke Cart'),
                ),
              );
              cart.addCart(
                productItem.id,
                productItem.title,
                productItem.price,
              );
            },
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailScreen.routeName,
              arguments: productItem.id,
            );
          },
          child: Image.network(
            productItem.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
