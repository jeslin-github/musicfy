// import 'dart:io';

// import 'package:flutter/material.dart';

// import 'package:permission_handler/permission_handler.dart';
// import 'package:simphony/features/homepage/bottom_nav.dart';
// import 'package:simphony/features/library/logic/library_functions.dart';
// import 'package:simphony/features/login/locgic/shared_pref_services.dart';
// import 'package:simphony/features/login/login.dart';

// class SplashScreen extends StatefulWidget {
//   const SplashScreen({super.key});

//   @override
//   State<SplashScreen> createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   @override
//   void initState() {
//     goToLogin();

//     super.initState();
//   }

//   @override
//   void dispose() {
//     initDatabase();
//   }
//   //=============================================

//   Future<void> goToLogin() async {
//     await Future.delayed(const Duration(seconds: 3));

//     // await permissionStatusChecker();

//     Navigator.of(context).pushReplacement(
//       MaterialPageRoute(
//           builder: (ctx) => SharedprefServices.isNameStored()
//               ? const BottomNav()
//               : LoginScreen()),
//     );
//   }

//   //===================================================================
//   Future<void> initDatabase() async {
//     print("intit data called....................................");
//     await storeSongs();
//     await getSongs();
//   }
//   //?============================================================================ permissionStatusChecker====================

//   Future<void> permissionStatusChecker() async {
//     PermissionStatus status;

//     await Future.delayed(const Duration(seconds: 5));

//     status = await requestAudioPermission();
//     if (status.isDenied) {
//       status = await requestAudioPermission();

//       if (status.isPermanentlyDenied) {

//         if (openAppSettings() == true) {
//           status.isGranted;
//         }
//       }
//     }
//   }

//   //?=============================================================================helper function of permission status checker====================

//   Future<PermissionStatus> requestAudioPermission() async {
//     PermissionStatus status;

//     if (Platform.isAndroid && await _isAndroid13OrHigher()) {
//       // For Android 13 and above, request permission to access media files (audio)
//       status = await Permission.audio.request();
//     } else {
//       // For Android versions below 13, request permission for storage
//       status = await Permission.storage.request();
//     }

//     return status;
//   }

// // Helper function to check Android version
//   Future<bool> _isAndroid13OrHigher() async {
//     return Platform.operatingSystemVersion.contains('13');
//   }

// //======================================================================================build funtions
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body: SafeArea(
//         child: Center(
//           child: Image.asset("assets/image/appicon.png"),
//         ),
//       ),
//     );
//   }
// }
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:simphony/features/homepage/bottom_nav.dart';
import 'package:simphony/features/login/locgic/shared_pref_services.dart';
import 'package:simphony/features/login/login.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    goToLogin();
  }

  //=============================================

  Future<void> goToLogin() async {
    await permissionStatusChecker();

    Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (ctx) => SharedprefServices.isNameStored()
            ? const BottomNav()
            : LoginScreen(),),);
  }

  //===================================================================

  Future<void> permissionStatusChecker() async {
    await Future.delayed(const Duration(seconds: 2)); // Splash delay

    PermissionStatus status = await requestAppropriatePermission();

    if (status.isDenied) {
      // If permission is denied, ask again
      status = await requestAppropriatePermission();
    }

    if (status.isPermanentlyDenied) {
      // If permission is permanently denied, open settings
      bool opened = await openAppSettings();
      if (!opened) {
        print('Please enable permissions from app settings.');
      }
    }
  }

  //?=============================================================================Helper function====================

  Future<PermissionStatus> requestAppropriatePermission() async {
    if (Platform.isAndroid) {
      final androidVersion = await getAndroidVersion();

      if (androidVersion >= 13) {
        // Android 13 and above
        return await Permission.audio.request();
      } else {
        // Android below 13
        return await Permission.storage.request();
      }
    }
    return PermissionStatus.denied;
  }

  Future<int> getAndroidVersion() async {
    final version = Platform.operatingSystemVersion;
    final match = RegExp(r'(\d+)').firstMatch(version);
    return match != null ? int.parse(match.group(1)!) : 0;
  }

  //======================================================================================Build Function====================
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Center(
          child: Icon(
            Icons.music_note,
            color: Colors.red,
            size: 100,
          ),
        ),
      ),
    );
  }
}
