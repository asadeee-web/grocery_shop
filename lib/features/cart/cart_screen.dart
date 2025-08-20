import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:grocery_shop_app/core/utils/strings.dart';
import 'package:grocery_shop_app/features/favourite/favourite_screen.dart';
import 'package:grocery_shop_app/widgets/custom_circle_button.dart';
import 'package:grocery_shop_app/core/models/items.dart';
import 'package:grocery_shop_app/features/cart/cart_provider.dart';
import 'package:grocery_shop_app/core/utils/colors.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // Sample data to populate the cart.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Cart',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
      ),
      body: Column(
        children: [
          // Expanded(
          //   child: ListView.separated(
          //     itemCount: cartItems.length,
          //     separatorBuilder:
          //         (context, index) => const Divider(
          //           color: Colors.grey,
          //           height: 1,
          //           thickness: 0.5,
          //         ),
          //     itemBuilder: (context, index) {
          //       final item = cartItems[index]['item'] as FavoriteItem;
          //       int quantity = cartItems[index]['quantity'] as int;

          //       return Padding(
          //         padding: const EdgeInsets.symmetric(
          //           horizontal: 16.0,
          //           vertical: 8.0,
          //         ),
          //         child: Row(
          //           crossAxisAlignment: CrossAxisAlignment.start,
          //           children: [
          //             // ✅ Product image
          //             ClipRRect(
          //               borderRadius: BorderRadius.circular(12),
          //               child: Image.asset(
          //                 apple,
          //                 width: 70,
          //                 height: 70,
          //                 fit: BoxFit.cover,
          //               ),
          //             ),
          //             const SizedBox(width: 16.0),

          //             // ✅ Expanded for name + details (takes remaining width)
          //             Expanded(
          //               child: Column(
          //                 crossAxisAlignment: CrossAxisAlignment.start,
          //                 children: [
          //                   Text(
          //                     item.name,
          //                     style: const TextStyle(
          //                       fontWeight: FontWeight.bold,
          //                       fontSize: 16,
          //                     ),
          //                     overflow: TextOverflow.ellipsis,
          //                   ),
          //                   const SizedBox(height: 4.0),
          //                   Text(
          //                     item.details,
          //                     style: TextStyle(
          //                       color: Colors.grey[600],
          //                       fontSize: 14,
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),

          //             // ✅ Column with remove button + quantity control + price
          //             Column(
          //               crossAxisAlignment: CrossAxisAlignment.end,
          //               children: [
          //                 // Remove button
          //                 IconButton(
          //                   onPressed: () {
          //                     // TODO: Implement remove item from cart
          //                   },
          //                   icon: const Icon(
          //                     Icons.close,
          //                     size: 20,
          //                     color: Colors.grey,
          //                   ),
          //                   splashRadius: 20,
          //                 ),

          //                 // Quantity controls
          //                 Row(
          //                   mainAxisSize: MainAxisSize.min,
          //                   children: [
          //                     IconButton(
          //                       onPressed: () {
          //                         // TODO: Decrement quantity
          //                       },
          //                       icon: const Icon(Icons.remove, size: 20),
          //                       splashRadius: 20,
          //                     ),
          //                     Text(
          //                       quantity.toString(),
          //                       style: const TextStyle(
          //                         fontWeight: FontWeight.bold,
          //                         fontSize: 16,
          //                       ),
          //                     ),
          //                     IconButton(
          //                       onPressed: () {
          //                         // TODO: Increment quantity
          //                       },
          //                       icon: const Icon(Icons.add, size: 20),
          //                       splashRadius: 20,
          //                     ),
          //                   ],
          //                 ),

          //                 // Price
          //                 Text(
          //                   item.price,
          //                   style: const TextStyle(
          //                     fontWeight: FontWeight.bold,
          //                     fontSize: 16,
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ],
          //         ),
          //       );
          //     },
          //   ),
          // ),

          // ✅ Checkout button
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: () {
                  // TODO: Implement checkout
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                child: const Text(
                  'Go to Checkout',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
