import 'dart:math';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:simphony/common/fetch_functions/fetch_songs.dart';
import 'package:simphony/common/model/musicfy_song_model.dart';

ValueNotifier<List<MusicfySongModel>> songsListNotifier = ValueNotifier([]);

Future<void> storeSongs() async {

   print("intit store song c...................................................... called");
  
  final songs = await filterSongs(fetchlastSongs());

  final songsDB = await Hive.openBox<MusicfySongModel>('songsBox');

  for (var song in songs) {
    if (!songsDB.values.any((s) => s.songid == song.id)) {
      var generatedKey = await songsDB.add(
        MusicfySongModel(
          songid: song.id,
          displayNameWOExt: song.displayNameWOExt,
          artist: song.artist ?? "Unknown Artist",
          uri: song.uri,
        ),
      );

      //? add generated key to same object
      MusicfySongModel updatedSong = MusicfySongModel(
        id: generatedKey,
        songid: song.id,
        displayNameWOExt: song.displayNameWOExt,
        artist: song.artist ?? "Unknown Artist",
        uri: song.uri,
      );//?

      // Put the updated song back into the database
      await songsDB.put(generatedKey, updatedSong);
    }
  }

  getSongs();
}

Future<void> getSongs() async {
  final songsDB = await Hive.openBox<MusicfySongModel>('songsBox');
  songsListNotifier.value.clear();
  songsListNotifier.value.addAll(songsDB.values);
  //lastsongsListNotifier.value.addAll(songsDB.values.take(30));
  songsListNotifier.notifyListeners();
}

Future<void> shuffleSongs() async {
  songsListNotifier.value.shuffle(Random());
  songsListNotifier.notifyListeners();
}
