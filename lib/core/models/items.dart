import 'package:flutter/material.dart';

class Item {
  final String name;
  final String description;
  final String image;
  final double price;

  bool itemAdded;

  Item({
    required this.name,
    required this.image,
    required this.price,

    required this.description,
    required this.itemAdded,
  });
}
