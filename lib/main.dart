import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:grocery_shop_app/core/models/items.dart';
import 'package:grocery_shop_app/features/favourite/favourite_view_model.dart';
import 'package:grocery_shop_app/features/home/product_details/product_detail_view_model.dart';

import 'package:grocery_shop_app/features/landing/landing_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        return MultiProvider(
          providers: [
            ChangeNotifierProvider(create: (_) => FavoriteViewModel()),
          ],
          child: GetMaterialApp(
            title: 'Grocery Shop App',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              brightness: Brightness.light,
              fontFamily: "font-regular",

              scaffoldBackgroundColor: Colors.white,
            ),
            home: LandingScreen(),
          ),
        );
      },
    );
  }
}
