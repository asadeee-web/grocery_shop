import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/utils.dart';
import 'package:grocery_shop_app/core/utils/textStyle.dart';
import 'package:grocery_shop_app/features/home/product_details/product_detail_screen.dart';
import 'package:grocery_shop_app/widgets/custom_items_card.dart';
import 'package:grocery_shop_app/features/home/home_provider.dart';
import 'package:grocery_shop_app/core/utils/colors.dart';
import 'package:grocery_shop_app/widgets/custom_searchfeild.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomeViewModel>(
      builder: (context, model, child) {
        return SafeArea(
          child: Scaffold(
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.location_pin),
                        Text(
                          "Peshawar Pakistan ,KPK",
                          style: style16.copyWith(fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                    CustomSearchField(
                      hintText: 'Search Store',
                      onChanged: (value) {
                        model.filterCategories(value);
                      },
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Recommended for You",
                          style: style16.copyWith(
                            fontSize: 18,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Show all",
                          style: style14.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 10),
                    model.filteredItems.isEmpty
                        ? Center(
                          child: Text(
                            "No Item Found",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          itemCount: model.filteredItems.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisExtent: 220,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),

                          itemBuilder: (context, index) {
                            final item = model.filteredItems[index];
                            return CustomItemsCard(
                              onTap: () {
                                Get.to(ProductDetailScreen(item: item));
                              },

                              name: item.name,
                              description: item.description,
                              image: item.image,
                              price: item.price,
                              isAdded: item.itemAdded,
                              onPressed: () {
                                model.toggleItem(index);
                              },
                            );
                          },
                        ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
