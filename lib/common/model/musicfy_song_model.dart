import 'package:hive_flutter/hive_flutter.dart';
part 'musicfy_song_model.g.dart';

@HiveType(typeId: 1)
class MusicfySongModel extends HiveObject {
  @HiveField(0)
  int? id;
  @HiveField(1)
  final int songid;

  @HiveField(2)
  final String displayNameWOExt;

  @HiveField(3)
  final String artist;

  @HiveField(4)
  final String? uri;

  @HiveField(5)
  DateTime? recentlyPlayed;

  @HiveField(6)
  int? playCount;

  MusicfySongModel({
    this.id,
    required this.songid,
    required this.displayNameWOExt,
    required this.artist,
    required this.uri,
    this.recentlyPlayed,
    this.playCount = 0,
  });
}
