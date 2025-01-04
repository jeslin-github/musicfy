import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
import 'package:simphony/common/const/emoji_collection.dart';
import 'package:simphony/features/Emotion_list/emotion_card.dart';

class EmotionList extends StatelessWidget {
  const EmotionList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 152,
      width: double.infinity,
      color: Colors.black,
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Let the Column take the minimum space
        children: [
          // Section Heading
          Container(
            padding: const EdgeInsets.only(bottom: 5),
            height: 40,
            child: Text(
              "Emotion List",
              style: const TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),

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
                Emoji emoji = emotionEmojis[index];
                return EmotionCard(smile: emoji, name: emoji.name);
              },
            ),
          ),
        ],
      ),
    );
  }
}
