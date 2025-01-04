import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:simphony/common/model/musicfy_song_model.dart';
import 'package:simphony/common/theme/theme.dart';
import 'package:simphony/features/login/locgic/shared_pref_services.dart';
import 'package:simphony/features/splash/splash.dart';

ValueNotifier<ThemeMode> themeNotifier =
    ValueNotifier<ThemeMode>(ThemeMode.light);

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedprefServices.init();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(MusicfySongModelAdapter().typeId)) {
    Hive.registerAdapter(MusicfySongModelAdapter());
  }


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ThemeMode>(
        valueListenable: themeNotifier,
        builder: (context, themeMode, child) {
          return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: lightMode,
              darkTheme: darkMode,
              themeMode: themeMode,
              home: const SplashScreen()
              // EmojiDisplayScreen(),
              );
        });

    // );
  }
}
