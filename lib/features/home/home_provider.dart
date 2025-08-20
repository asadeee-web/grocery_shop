import 'package:flutter/material.dart';
import 'package:grocery_shop_app/core/models/items.dart';
import 'package:grocery_shop_app/core/utils/strings.dart';

class HomeViewModel extends ChangeNotifier {
  List<Item> filteredItems = [];
  List<Item> cartItems = [];
  List<Item> itmes = [
    Item(
      name: "Ginger",
      image: ginger,
      price: 12,
      description: "1kg, Priceg",
      itemAdded: false,
    ),
    Item(
      name: "Pomegranate ",
      image: fruits,
      price: 10,
      description: "1kg, Priceg",
      itemAdded: false,
    ),
    Item(
      name: "Beaf Bone",
      image: beef,
      price: 30,
      description: "1kg, Fresh",
      itemAdded: false,
    ),
    Item(
      name: "Eggs",
      image: eggs,
      price: 50,
      description: "12pcs, Organic",
      itemAdded: false,
    ),
    Item(
      name: "Apple",
      image: apple,
      price: 8,
      description: "1kg, Priceg",
      itemAdded: false,
    ),
    Item(
      name: "Broiler Chicken",
      image: chicken,
      price: 25,
      description: "1kg, Fresh",
      itemAdded: false,
    ),
    Item(
      name: "Bell Pepper Red",
      image: peper,
      price: 5,
      description: "500g, Spicy",
      itemAdded: false,
    ),
  ];

  HomeViewModel() {
    filteredItems = itmes;
  }

  void toggleItem(int index) {
    itmes[index].itemAdded = !itmes[index].itemAdded;
    updateCart(itmes[index]);
    notifyListeners();
  }

  void updateCart(Item item) {
    if (item.itemAdded) {
      if (!cartItems.contains(item)) {
        cartItems.add(item);
      }
    } else {
      cartItems.remove(item);
    }

    print("Cart Items Count: ${cartItems.length}");
  }

  void updateItemQuantity(Item item, int newQuantity) {
    item.quantity = newQuantity;
    notifyListeners();
  }

  double get totalAmount {
    double total = 0.0;
    for (var item in cartItems) {
      total += item.price * item.quantity;
    }
    return total;
  }

  void filterCategories(String query) {
    final lowerQuery = query.toLowerCase();

    filteredItems =
        itmes.where((category) {
          return category.name.toLowerCase().contains(lowerQuery);
        }).toList();
    notifyListeners();
  }
}
