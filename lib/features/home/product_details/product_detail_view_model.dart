import 'package:flutter/cupertino.dart';
import 'package:grocery_shop_app/core/models/items.dart';

class ProductDetailViewModel extends ChangeNotifier {
  int _quantity = 1;

  int get quantity => _quantity;

  void increase() {
    _quantity++;
    notifyListeners();
  }

  void decrease() {
    if (_quantity <= 0) {
      return;
    }
    _quantity--;
    notifyListeners();
  }
}
