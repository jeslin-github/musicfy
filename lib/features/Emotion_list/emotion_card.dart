import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';

class EmotionCard extends StatelessWidget {
  final Emoji smile;
  final String name;

  const EmotionCard({super.key, required this.smile, required this.name});
  @override
  Widget build(BuildContext context) {
    // Fetching multiple emojis from the package

    return Container(
      width: 100,
      height: 120, // Adjusted height for better spacing
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: Colors.blueGrey[800],
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          // Display Multiple Emojis
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Center(
                child: CircleAvatar(
                  child: Text(
                    smile.char,
                    // emojis[0] ?? '',
                    style: TextStyle(fontSize: 24),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          // Emotion Label
          Text(
            name,
            style: TextStyle(
              fontSize: 12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
