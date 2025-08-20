import 'package:flutter/material.dart';
import 'package:grocery_shop_app/core/models/items.dart';

class CartProvider extends ChangeNotifier {
  List<Item> cartItem = [];
  //int? totalAmonnt;

  CartProvider();

  removeItem(int index) {
    cartItem.removeAt(index);
    notifyListeners();
  }
}
