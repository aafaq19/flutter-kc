import 'package:flutter/material.dart';

class CartItem {
  final int id;
  final String name;
  int quantity;

  CartItem({required this.id, required this.name, this.quantity = 1});
}

class CartProvider with ChangeNotifier {
  final List<CartItem> _cart = [];

  List<CartItem> get cart => _cart;
  void increaseQuantity(CartItem cartItem) {
    int index = _cart.indexWhere((item) => item.id == cartItem.id);
    if (index != -1) {
      _cart[index].quantity++;
      notifyListeners();
    }
  }

  void decreaseQuantity(CartItem cartItem) {
    int index = _cart.indexWhere((item) => item.id == cartItem.id);
    if (index != -1) {
      if (_cart[index].quantity > 1) {
        _cart[index].quantity--;
      } else {
        _cart.removeAt(index);
      }
      notifyListeners();
    }
  }

  static of(BuildContext context) {}
}
