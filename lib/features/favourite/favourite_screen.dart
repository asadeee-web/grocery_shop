import 'package:flutter/material.dart';
import 'package:grocery_shop_app/core/utils/textStyle.dart';
import 'package:grocery_shop_app/features/favourite/favourite_view_model.dart';
import 'package:grocery_shop_app/widgets/custom_button.dart';
import 'package:grocery_shop_app/widgets/custom_favourite_card.dart';
import 'package:provider/provider.dart';

class FavouriteScreen extends StatelessWidget {
  const FavouriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoriteViewModel>(
      builder: (_, model, child) {
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: _appBar(),
          body: Column(
            children: [
              Expanded(
                child:
                    model.items.isEmpty
                        ? Center(
                          child: Text(
                            "No Favourite Item Added",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        : ListView.separated(
                          itemCount: model.items.length,
                          separatorBuilder:
                              (context, index) => const Divider(
                                color: Colors.grey,
                                height: 1,
                                thickness: 0.5,
                              ),
                          itemBuilder: (context, index) {
                            final item = model.items[index];
                            return CustomFavouriteCard(
                              name: item.name,
                              description: item.description,
                              image: item.image,
                              price: item.price,
                            );
                          },
                        ),
              ),

              if (model.items.isNotEmpty)
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CustomButton(
                    text:
                        model.items.length > 1
                            ? "Add All To Cart"
                            : "Add To Card",
                    onPressed: () {},
                  ),
                ),
            ],
          ),
        );
      },
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Favorite',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
