import 'package:flutter/material.dart';

class PlaylistScreen extends StatelessWidget {
  final List<Map<String, String>> songs = [
    {'title': 'Never', 'artist': 'Heart . VEVO'},
    {'title': 'Always', 'artist': 'Soul . VEVO'},
    {'title': 'Forever', 'artist': 'Band . VEVO'},
    {'title': 'Echo', 'artist': 'Sound . VEVO'},
    {'title': 'Shine', 'artist': 'Light . VEVO'},
    {'title': 'Glow', 'artist': 'Radiance . VEVO'},
  ];

  PlaylistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFF3F2F77),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back,
              color: Colors.white), // White back arrow
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'Favourite Songs',
          style: TextStyle(color: Colors.white), // White font color
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.shuffle,
                color: Colors.white), // White shuffle icon
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
              style:
                  const TextStyle(color: Colors.white), // White text for input
              decoration: InputDecoration(
                hintText: 'Search a Music',
                hintStyle:
                    const TextStyle(color: Colors.white54), // White hint text
                prefixIcon:
                    const Icon(Icons.search, color: Colors.white), // White icon
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.white), // White border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  borderSide:
                      const BorderSide(color: Colors.white), // White border
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFF6A5BAA), // Lighter shade
                    child: Icon(Icons.music_note, color: Colors.white),
                  ),
                  title: Text(
                    songs[index]['title']!,
                    style: TextStyle(color: Colors.white),
                  ),
                  subtitle: Text(
                    songs[index]['artist']!,
                    style: TextStyle(color: Colors.grey),
                  ),
                  trailing: Icon(Icons.more_vert, color: Colors.white),
                  onTap: () {
                    // Navigate to now playing or details
                  },
                );
              },
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Color(0xFF3F2F77),
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favorite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_play),
            label: 'Playlist',
          ),
        ],
      ),
      backgroundColor: Color(0xFF3F2F77),
    );
  }
}
