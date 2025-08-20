import 'package:flutter/material.dart';
import 'package:grocery_shop_app/core/utils/colors.dart';
import 'package:grocery_shop_app/core/utils/strings.dart';
import 'package:grocery_shop_app/widgets/custom_button.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            // Profile Header
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  // Profile Image
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: AssetImage(profileImage),
                  ),
                  const SizedBox(width: 12),
                  // Name + Email
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Text(
                            "Asad Qureshi",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(width: 5),
                          Icon(Icons.edit, size: 16, color: Colors.green),
                        ],
                      ),
                      Text(
                        "asadeee998@gmail.com",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            const Divider(),

            // Menu Items
            Expanded(
              child: ListView(
                children: [
                  _buildMenuItem(Icons.shopping_bag_outlined, "Orders"),
                  _buildMenuItem(Icons.credit_card, "My Details"),
                  _buildMenuItem(
                    Icons.location_on_outlined,
                    "Delivery Address",
                  ),
                  _buildMenuItem(Icons.payment_outlined, "Payment Methods"),
                  _buildMenuItem(Icons.local_offer_outlined, "Promo Code"),
                  _buildMenuItem(Icons.notifications_none, "Notifications"),
                  _buildMenuItem(Icons.help_outline, "Help"),
                  _buildMenuItem(Icons.info_outline, "About"),
                ],
              ),
            ),

            // Logout Button
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: CustomButton(
                text: "Log Out",
                onPressed: () {},
                textColor: AppColors.primaryColor,
                backgroundColor: Colors.grey.shade100,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMenuItem(IconData icon, String title) {
    return ListTile(
      leading: Icon(icon, color: Colors.black87),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
      trailing: Icon(Icons.arrow_forward_ios, size: 16, color: Colors.black54),
      onTap: () {},
    );
  }
}
