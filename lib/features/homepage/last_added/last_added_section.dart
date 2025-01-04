import 'package:flutter/material.dart';
import 'package:simphony/features/homepage/frequently_played/frequently_songs_screen.dart';
import 'package:simphony/features/homepage/heading.dart';
import 'package:simphony/features/homepage/last_added/last_added_card.dart';

class LastAddedSection extends StatelessWidget {
  const LastAddedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Let the Column take the minimum space
        children: [
          // Section Heading
          Heading(
              title: "Last Added", screen: () => const FrequentlySongsScreen()),

          // Horizontal List of Cards
          SizedBox(
            height: 95,
            // Defined height for ListView
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: 10,
              separatorBuilder: (BuildContext context, int index) {
                return const SizedBox(width: 8);
              },
              itemBuilder: (BuildContext context, int index) {
                return const LastAddedCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
