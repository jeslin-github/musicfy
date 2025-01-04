import 'package:flutter/material.dart';

class FavoriteScreen extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {'title': 'Never', 'artist': 'Heart . VEVO'},
    {'title': 'Always', 'artist': 'Soul . VEVO'},
    {'title': 'Forever', 'artist': 'Band . VEVO'},
    {'title': 'Echo', 'artist': 'Sound . VEVO'},
    {'title': 'Shine', 'artist': 'Light . VEVO'},
    {'title': 'Glow', 'artist': 'Radiance . VEVO'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor:const Color(0xFF3F2F77),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white), // White back arrow
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'All Songs',
          style: TextStyle(color: Colors.white), // White title
        ),
        actions: [
          IconButton(
            icon:
                const Icon(Icons.shuffle, color: Colors.white), // White shuffle icon
            onPressed: () {
              // Shuffle action
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              style: const TextStyle(color: Colors.white), // White text for input
              decoration: InputDecoration(
                hintText: 'Search a Music',
                hintStyle: const TextStyle(color: Colors.white54), // White hint text
                prefixIcon:
                    const Icon(Icons.search, color: Colors.white), // White icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white), // White border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide: const BorderSide(color: Colors.white), // White border
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  child: ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: Color(0xFF6A5BAA),
                      child: Icon(Icons.music_note, color: Colors.white),
                    ),
                    title: Text(
                      songs[index]['title']!,
                      style: const TextStyle(color: Colors.white),
                    ),
                    subtitle: Text(
                      songs[index]['artist']!,
                      style: const TextStyle(color: Colors.grey),
                    ),
                    trailing: const Icon(Icons.more_vert, color: Colors.white),
                    onTap: () {
                      // Navigate to now playing or details
                    },
                  ),
                );
              },
            ),
          ),
        ],
      ),
      backgroundColor:  const Color(0xFF3F2F77),
    );
  }
}
