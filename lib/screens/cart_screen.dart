import 'package:flutter/material.dart';
import 'package:flutter_provider/providers/cart_provider.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  static const routeName = '/cart';

  NumberFormat toIdr = NumberFormat.currency(
    locale: 'id',
    symbol: 'Rp ',
    decimalDigits: 2,
  );

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartProvider>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Picture Cart"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Card(
            margin: const EdgeInsets.all(20),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              child: Text(
                'Total : ${toIdr.format(cartData.totalPrice)}',
                style: const TextStyle(
                  fontSize: 30,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartData.items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(cartData.items.values.toList()[index].title),
                  subtitle: Text(
                      'quantity : ${cartData.items.values.toList()[index].qty}'),
                  trailing: Container(
                    child: Text(
                        '${toIdr.format(cartData.items.values.toList()[index].price * cartData.items.values.toList()[index].qty)}'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
