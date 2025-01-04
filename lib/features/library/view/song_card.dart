import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:simphony/common/globel_instance/globel_instance.dart';
import 'package:simphony/common/model/musicfy_song_model.dart';
import 'package:simphony/common/scrolling_name.dart';

class SongCard extends StatelessWidget {
  final MusicfySongModel song;

  const SongCard({super.key, required this.song});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        child: QueryArtworkWidget(
          controller: GlobelInstance.ofOnAudio,
          id: song.songid,
          type: ArtworkType.AUDIO,
          nullArtworkWidget: const Icon(
            Icons.music_note,
            size: 40,
            color: Colors.red, // Set icon color
          ),
          artworkFit: BoxFit.cover,
          artworkBorder: BorderRadius.circular(50),
        ),
      ),
      title: ScrollingName(name: song.displayNameWOExt),
      // Text(
      //   song.displayNameWOExt,
      // ),
      subtitle: Text(
        song.artist,
      ),
      trailing: const Icon(
        Icons.more_vert,
      ),
      onTap: () {
        // Navigate to now playing or details
      },
    );
  }
}
