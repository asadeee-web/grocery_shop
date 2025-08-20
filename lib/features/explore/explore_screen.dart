import 'package:flutter/material.dart';

import 'package:grocery_shop_app/core/utils/textStyle.dart';
import 'package:grocery_shop_app/features/explore/explore_view_model.dart';
import 'package:grocery_shop_app/widgets/custom_explore_card.dart';
import 'package:grocery_shop_app/widgets/custom_searchfeild.dart';
import 'package:provider/provider.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ExploreViewModel(),
      child: Consumer<ExploreViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: _appBar(),
            body: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    CustomSearchField(
                      hintText: 'Search Products',
                      onChanged: (value) {
                        model.filterCategories(value);
                      },
                    ),

                    // Category grid
                    model.filteredCategories.isEmpty
                        ? Center(
                          child: Text(
                            "No Categories Found",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                        : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 16.0,
                                mainAxisSpacing: 16.0,
                                childAspectRatio: 0.85,
                              ),
                          itemCount: model.filteredCategories.length,
                          itemBuilder: (context, index) {
                            final category = model.filteredCategories[index];
                            return ExploreCard(
                              imagePath: category.imageUrl,
                              title: category.name,
                              backgroundColor: category.backgroundColor,
                              onTap: () {
                                // Handle tap
                                print('Tapped on ${category.name}');
                              },
                            );
                          },
                        ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  AppBar _appBar() {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: const Text(
        'Find Products',
        style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }
}
