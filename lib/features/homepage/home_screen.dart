import 'package:flutter/material.dart';
import 'package:simphony/features/homepage/appbar.dart';
import 'package:simphony/features/homepage/frequently_played/frequently_played_section.dart';
import 'package:simphony/features/homepage/last_added/last_added_section.dart';
import 'package:simphony/features/homepage/recently_played/recently_played.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(), //todo text , menu icons
      body: Container(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: SingleChildScrollView(
            child: SizedBox(
              child: Column(
                children: [
                  const FrequentlyPlayedSection(),
                  const RecentlyPlayed(),
                  const LastAddedSection(),
                  // EmotionList(),
                  Container(
                    height: 160,
                    width: double.infinity,
                    color: Colors.red,
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
