import 'package:flutter/material.dart';
import 'package:grocery_shop_app/core/utils/colors.dart';
import 'package:grocery_shop_app/core/utils/textStyle.dart';

class CustomItemsCard extends StatelessWidget {
  final String name;
  final String description; // e.g. "7pcs, Priceg"
  final String image;
  final double price;
  final bool isAdded;
  final VoidCallback onTap;
  final VoidCallback onPressed;

  const CustomItemsCard({
    super.key,
    required this.name,
    required this.description,
    required this.image,
    required this.price,
    required this.isAdded,
    required this.onPressed,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        //width: 160,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey.shade300),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Product Image
              Center(
                child: Hero(
                  tag: name,
                  child: Image.asset(
                    image,
                    width: 100,
                    height: 80,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 12),

              // Product Name
              Text(name, style: style14.copyWith(fontWeight: FontWeight.w600)),

              // Description
              Text(
                description,
                style: style12.copyWith(
                  fontSize: 13,
                  color: AppColors.lightGreyText,
                ),
              ),

              const SizedBox(height: 12),

              // Price and Add Button Row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "\$${price.toStringAsFixed(2)}",
                    style: style16.copyWith(fontWeight: FontWeight.w600),
                  ),
                  GestureDetector(
                    onTap: onPressed,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(12),
                        //shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isAdded ? Icons.done : Icons.add,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
