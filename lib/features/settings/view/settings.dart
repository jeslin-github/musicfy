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
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back)),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 20),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: ListTile(
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
                          ? const Icon(
                              Icons.dark_mode,
                              size: 25,
                            )
                          : const Icon(
                              Icons.light_mode,
                              size: 25,
                            ),
                    );
                  },
                ),
                title: Text("ThemeMode"),
              ),
            ),
            const Expanded(
                flex: 1,
                child: ListTile(
                  leading: Icon(Icons.settings),
                  title: Text("Settings"),
                )),
            const Expanded(
              flex: 1,
              child: ListTile(
                leading: Icon(Icons.lock),
                title: Text("Privacy Policy"),
              ),
            ),
            GestureDetector(
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
                                  builder: (context) => const SplashScreen()
                                  // const OnBoardingPage(),
                                  ),
                              (route) => false, // Retains only the first route
                            );
                            //  await Helper.player.pause();
                            SharedprefServices.clearAll();
                            // Perform logout action
                            // Navigator.of(context).pop();
                          },
                          child: const Text("Logout"),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Expanded(
                flex: 1,
                child: ListTile(
                  leading: Icon(Icons.logout),
                  title: Text("Log out"),
                ),
              ),
            ),
            const Expanded(
              flex: 7,
              child: SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
