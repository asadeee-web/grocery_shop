import 'package:flutter/material.dart';

class Item {
  final String name;
  final String image;
  final double price;
  final String description;
  bool itemAdded;
  int quantity;

  Item({
    required this.name,
    required this.image,
    required this.price,
    required this.description,
    this.itemAdded = false,
    this.quantity = 1,
  });
}
