import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/cart.dart';

class CartProvider with ChangeNotifier {
  final Map<String, Cart> _items = {};
  

  Map<String, Cart> get items => _items;

  int get itemsQty {
    return _items.length;
  }

  double get totalPrice {
    var total = 0.0;
    _items.forEach((key, cartItem) {
      total += cartItem.qty * cartItem.price;
    });
    return total;
  }

  void addCart(String productId, String title, double price) {
    if (_items.containsKey(productId)) {
      // kondisi ketika product id sudah tersedia
      _items.update(
        productId,
        (value) => Cart(
          id: value.id,
          title: value.title,
          price: value.price,
          qty: value.qty + 1,
        ),
      );
    } else {
      // kondisi ketika menambah product id baru
      _items.putIfAbsent(
        productId,
        () => Cart(
          id: DateTime.now().toString(),
          title: title,
          price: price,
          qty: 1,
        ),
      );
    }
    notifyListeners();
  }
}
