import 'package:flutter/cupertino.dart';
import 'package:grocery_shop_app/core/models/catogory.dart';
import 'package:grocery_shop_app/core/utils/strings.dart';

class ExploreViewModel extends ChangeNotifier {
  List<Category> filteredCategories = [];
  final List<Category> categories = const [
    Category(
      name: 'Fresh Fruits\n& Vegetable',
      imageUrl: "$images/beverages.png",
      backgroundColor: Color(0xFFE6F3E6),
    ),
    Category(
      name: 'Cooking Oil\n& Ghee',
      imageUrl: "$images/ghee.png",
      backgroundColor: Color(0xFFF9E8D4),
    ),
    Category(
      name: 'Meat & Fish',
      imageUrl: "$images/meat.png",
      backgroundColor: Color(0xFFF9D4D4),
    ),
    Category(
      name: 'Bakery & Snacks',
      imageUrl: "$images/bakery.png",
      backgroundColor: Color(0xFFD4E9F9),
    ),
    Category(
      name: 'Dairy & Eggs',
      imageUrl: "$images/diary.png",
      backgroundColor: Color(0xFFF9F3D4),
    ),
    Category(
      name: 'Beverages',
      imageUrl: "$images/pepsi.png",
      backgroundColor: Color(0xFFD4F9F3),
    ),
  ];
  ExploreViewModel() {
    filteredCategories = categories;
  }
  void filterCategories(String query) {
    final lowerQuery = query.toLowerCase();

    filteredCategories =
        categories.where((category) {
          return category.name.toLowerCase().contains(lowerQuery);
        }).toList();
    notifyListeners();
  }
}
