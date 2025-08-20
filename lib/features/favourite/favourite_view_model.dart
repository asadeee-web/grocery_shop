import 'package:flutter/cupertino.dart';
import 'package:grocery_shop_app/core/models/items.dart';

class FavoriteViewModel extends ChangeNotifier {
  final List<Item> _items = [];

  List<Item> get items => _items;

  bool isFavorite(Item item) => _items.contains(item);

  void toggleFavorite(Item item) {
    if (isFavorite(item)) {
      _items.remove(item);
    } else {
      _items.add(item);
    }
    notifyListeners();
  }
}
