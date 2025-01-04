import 'package:flutter/material.dart';
import 'package:simphony/features/login/locgic/shared_pref_services.dart';
import 'package:simphony/features/splash/splash.dart';
import 'package:simphony/main.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop(); // Navigate back
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Text('Settings'),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Theme Switcher
            ListTile(
              leading: ValueListenableBuilder<ThemeMode>(
                valueListenable: themeNotifier,
                builder: (BuildContext ctx, newTheme, _) {
                  return IconButton(
                    onPressed: () {
                      themeNotifier.value =
                          themeNotifier.value == ThemeMode.light
                              ? ThemeMode.dark
                              : ThemeMode.light;
                    },
                    icon: newTheme == ThemeMode.light
                        ? const Icon(Icons.dark_mode, size: 25)
                        : const Icon(Icons.light_mode, size: 25),
                  );
                },
              ),
              title: const Text("Theme Mode"),
            ),

            // Settings Option
            const ListTile(
              leading: Icon(Icons.settings),
              title: Text("Settings"),
            ),

            // Privacy Policy Option
            const ListTile(
              leading: Icon(Icons.lock),
              title: Text("Privacy Policy"),
            ),

            // Logout Option
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text("Log out"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text("Confirm Logout"),
                      content: const Text("Are you sure you want to log out?"),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: const Text("Cancel"),
                        ),
                        TextButton(
                          onPressed: () async {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SplashScreen()),
                              (route) => false,
                            );
                            SharedprefServices.clearAll();
                          },
                          child: const Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
              },
            ),

            // Spacer for remaining space
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
