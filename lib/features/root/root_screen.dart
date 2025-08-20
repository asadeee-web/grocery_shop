import 'package:flutter/material.dart';
import 'package:grocery_shop_app/core/utils/colors.dart';
import 'package:grocery_shop_app/core/utils/strings.dart';
import 'package:grocery_shop_app/core/utils/textStyle.dart';
import 'package:grocery_shop_app/features/account/account_screen.dart';
import 'package:grocery_shop_app/features/cart/cart_screen.dart';
import 'package:grocery_shop_app/features/explore/explore_screen.dart';
import 'package:grocery_shop_app/features/favourite/favourite_screen.dart';
import 'package:grocery_shop_app/features/home/home_screen.dart';
import 'package:provider/provider.dart';
import 'root_view_model.dart';

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => RootViewModel(),
      child: Consumer<RootViewModel>(
        builder: (context, model, child) {
          return Scaffold(
            body: PageView(
              controller: model.pageController,
              onPageChanged: model.onPageChanged,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                HomeScreen(),
                ExploreScreen(),
                CartScreen(),
                FavouriteScreen(),

                AccountScreen(),
              ],
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1), // shadow color
                    spreadRadius: 2, // how wide the shadow spreads
                    blurRadius: 10, // softness
                    offset: Offset(0, -2), // shadow direction (top side)
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                child: BottomNavigationBar(
                  backgroundColor: Colors.white,
                  currentIndex: model.selectedIndex,
                  onTap: model.onItemTapped,
                  selectedItemColor: AppColors.primaryColor,
                  unselectedItemColor: Colors.black,
                  selectedLabelStyle: style12.copyWith(
                    fontWeight: FontWeight.w600,
                    color: AppColors.primaryColor,
                  ),
                  unselectedLabelStyle: style12.copyWith(
                    fontWeight: FontWeight.w600,
                  ),
                  type: BottomNavigationBarType.fixed,
                  items: [
                    BottomNavigationBarItem(
                      icon: Image.asset(shopIcon, width: 24, height: 24),
                      activeIcon: Image.asset(shop1Icon, width: 24, height: 24),
                      label: 'Shop',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(searchIcon, width: 24, height: 24),
                      activeIcon: Image.asset(
                        search2Icon,
                        width: 24,
                        height: 24,
                      ),
                      label: 'Explore',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(cartIcon, width: 24, height: 24),
                      activeIcon: Image.asset(cart2Icon, width: 24, height: 24),
                      label: 'Cart',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(favtIcon, width: 24, height: 24),
                      activeIcon: Image.asset(favt2Icon, width: 24, height: 24),
                      label: 'Favourite',
                    ),
                    BottomNavigationBarItem(
                      icon: Image.asset(accountIcon, width: 24, height: 24),
                      activeIcon: Image.asset(
                        account2Icon,
                        width: 24,
                        height: 24,
                      ),

                      label: 'Account',
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
}
