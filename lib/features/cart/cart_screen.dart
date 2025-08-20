import 'package:flutter/material.dart';
import 'package:grocery_shop_app/core/utils/colors.dart';
import 'package:grocery_shop_app/features/home/home_provider.dart';
import 'package:grocery_shop_app/widgets/custom_cart_card.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            centerTitle: true,
            title: const Text(
              'My Cart',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          body:
              model.cartItems.isEmpty
                  ? const Center(
                    child: Text(
                      "Your cart is empty",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                  : Column(
                    children: [
                      Expanded(
                        child: ListView.separated(
                          itemCount: model.cartItems.length,
                          separatorBuilder:
                              (context, index) => const Divider(
                                color: Colors.grey,
                                height: 1,
                                thickness: 0.5,
                              ),
                          itemBuilder: (context, index) {
                            final item = model.cartItems[index];
                            return CustomCartCard(
                              item: item,
                              onRemove: () {
                                model.toggleItem(model.itmes.indexOf(item));
                              },
                              onQuantityChanged: (int value) {
                                model.updateItemQuantity(item, value);
                              },
                            );
                            ;
                          },
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(),
                                const Text(
                                  'Go to Checkout',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.all(4),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: AppColors.lightGrey,
                                  ),
                                  child: Text(
                                    "\$${model.totalAmount.toStringAsFixed(2)}",
                                    style: const TextStyle(
                                      fontSize: 18,
                                      color: AppColors.primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
        );
      },
    );
  }
}
