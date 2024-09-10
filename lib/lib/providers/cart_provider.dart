import 'package:flutter/material.dart';

class CartProvider extends ChangeNotifier {
      final List<Map<String, dynamic>> cart = [];
      void addProduct(Map<String, dynamic> product) {
        cart.add(product);
        notifyListeners();
      }
      void removeProduct(Map<String, dynamic> product) {
        cart.remove(product);
        notifyListeners();
      }

  void deleteItem(int index) {}

  void updateCart({required Map<String, dynamic> cartItem, required int updatedQuantity}) {}

  void decreaseQuantity(Map<String, dynamic> cartItem) {}

  void increaseQuantity(Map<String, dynamic> cartItem) {}
}