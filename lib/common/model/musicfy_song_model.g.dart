// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'musicfy_song_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class MusicfySongModelAdapter extends TypeAdapter<MusicfySongModel> {
  @override
  final int typeId = 1;

  @override
  MusicfySongModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return MusicfySongModel(
      id: fields[0] as int?,
      songid: fields[1] as int,
      displayNameWOExt: fields[2] as String,
      artist: fields[3] as String,
      uri: fields[4] as String?,
      recentlyPlayed: fields[5] as DateTime?,
      playCount: fields[6] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, MusicfySongModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.songid)
      ..writeByte(2)
      ..write(obj.displayNameWOExt)
      ..writeByte(3)
      ..write(obj.artist)
      ..writeByte(4)
      ..write(obj.uri)
      ..writeByte(5)
      ..write(obj.recentlyPlayed)
      ..writeByte(6)
      ..write(obj.playCount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is MusicfySongModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
