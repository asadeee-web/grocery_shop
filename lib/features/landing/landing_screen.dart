import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:grocery_shop_app/core/utils/colors.dart';
import 'package:grocery_shop_app/core/utils/strings.dart';
import 'package:grocery_shop_app/core/utils/textStyle.dart';
import 'package:grocery_shop_app/features/home/home_screen.dart';
import 'package:grocery_shop_app/features/root/root_screen.dart';
import 'package:grocery_shop_app/widgets/custom_button.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(bottom: 50, left: 20, right: 20),
        //alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(onboarding_image),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              "We Deliver Grocery At Your Door Step",
              textAlign: TextAlign.center,
              style: style16Bold.copyWith(fontSize: 28, color: Colors.white),
            ),
            SizedBox(height: 10),
            Text(
              "Groceer gives you fresh vegetables and fruits,Order fresh items from Groceer.",
              textAlign: TextAlign.center,
              style: style16.copyWith(fontSize: 16, color: AppColors.lightGrey),
            ),
            SizedBox(height: 30),
            CustomButton(
              text: 'Get Started',
              onPressed: () {
                Get.offAll(
                  transition: Transition.fade,
                  duration: Duration(milliseconds: 400),
                  () => const RootScreen(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
