import 'package:flutter/material.dart';
import 'package:simphony/features/login/locgic/shared_pref_services.dart';
import 'package:simphony/features/settings/view/settings.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text.rich(
        TextSpan(
          children: [
            const TextSpan(
              text: 'Hi,',
              style: TextStyle(
                fontWeight: FontWeight.bold, fontSize: 22,
                // Adjust font size as needed
              ),
            ),
            TextSpan(
              text: SharedprefServices.getName() ?? "",
              style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  letterSpacing: 1 // Adjust font size as needed
                  ),
            ),
          ],
        ),
      ),

      centerTitle: false, // Align title to the left
      // Background color of the AppBar
      leading: null, // Remove the leading widget
      actions: [
        IconButton(
          icon: const Icon(Icons.menu), // More options icon
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (ctx) => const SettingsScreen(),
              ),
            );
            debugPrint('More icon pressed'); //todo
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize =>
      const Size.fromHeight(kToolbarHeight); // Standard AppBar height
}
