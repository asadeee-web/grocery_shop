import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:grocery_shop_app/core/utils/colors.dart';
import 'package:grocery_shop_app/core/utils/strings.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class CustomBannerCard extends StatefulWidget {
  const CustomBannerCard({super.key});

  @override
  State<CustomBannerCard> createState() => _CustomBannerCardState();
}

class _CustomBannerCardState extends State<CustomBannerCard> {
  final List<Map<String, String>> banners = [
    {"imgUrl": "$images/banner1.jpg"},
    {"imgUrl": "$images/banner2.jpg"},
    //{"imgUrl": "https://via.placeholder.com/400x200?text=Banana"},
  ];

  int activeIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        10.verticalSpace,
        CarouselSlider.builder(
          itemCount: banners.length,
          options: CarouselOptions(
            onPageChanged: (index, reason) {
              setState(() => activeIndex = index);
            },
            autoPlay: true,
            autoPlayInterval: const Duration(seconds: 3),
            height: 188,
            aspectRatio: 1,
            viewportFraction: 1,
            initialPage: 0,
            enableInfiniteScroll: true,
            scrollDirection: Axis.horizontal,
          ),
          itemBuilder: (context, index, realIndex) {
            return GestureDetector(
              onTap: () {
                // handle tap
              },
              child: Container(
                width: 1.sw,
                padding: const EdgeInsets.all(24),
                margin: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.r),
                  image: DecorationImage(
                    image: AssetImage(banners[index]["imgUrl"]!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          },
        ),
        10.verticalSpace,
        AnimatedSmoothIndicator(
          activeIndex: activeIndex,
          count: banners.isNotEmpty ? banners.length : 1,
          effect: ExpandingDotsEffect(
            dotHeight: banners.isNotEmpty ? 10.h : 0,
            dotWidth: banners.isNotEmpty ? 10.w : 0,
            activeDotColor: AppColors.primaryColor,
            dotColor: Colors.grey,
          ),
        ),
      ],
    );
  }
}
