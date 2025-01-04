import 'package:emojis/emoji.dart';
import 'package:flutter/material.dart';
// Example library for emoji handling


class EmojiDisplayScreen extends StatelessWidget {
  final List<Emoji> emotionEmojis = Emoji.byKeyword('emotion').toList(); // Filter emojis by the keyword 'emotion'

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Emotion Emojis'),
      ),
      body: ListView.builder(
        itemCount: emotionEmojis.length,
        itemBuilder: (context, index) {
          Emoji emoji = emotionEmojis[index];
          return ListTile(
            leading: Text(
              emoji.char, // Display the emoji character
              style: TextStyle(fontSize: 32),
            ),
            title: Text(emoji.name ?? 'Unknown Emoji'), // Display the emoji's name
            subtitle: Text(
                'Category: ${emoji.emojiGroup}, Subgroup: ${emoji.emojiSubgroup}'), // Optional details
          );
        },
      ),
    );
  }
}
