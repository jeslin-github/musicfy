import 'package:flutter/material.dart';
import 'package:simphony/common/model/musicfy_song_model.dart';
import 'package:simphony/features/library/logic/library_functions.dart';
import 'song_card.dart';


class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
          ), // White back arrow
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
        title: const Text(
          'All Songs',
          // White title
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.shuffle,
            ), // White shuffle icon
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
              // White text for input
              decoration: InputDecoration(
                hintText: 'Search a Music',
                // White hint text
                prefixIcon: const Icon(
                  Icons.search,
                ), // White icon
                border: OutlineInputBorder(
                  borderRadius:
                      BorderRadius.circular(20), //todo change text field design
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  // White border
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  // White border
                ),
              ),
            ),
          ),
          Expanded(
            child: ValueListenableBuilder<List<MusicfySongModel>>(
                valueListenable: songsListNotifier,
                builder: (BuildContext ctx, List<MusicfySongModel> songs, _) {
                   if (songs.isEmpty) {
                      return const Center(child: Text("Nothing found!"));
                    }
                  return ListView.builder(
                    itemCount: songs.length,
                    itemBuilder: (context, index) {
                      final song = songs[index];
                      return GestureDetector(
                        child: SongCard(song: song),
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }
}
