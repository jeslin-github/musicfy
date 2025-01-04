import 'package:on_audio_query/on_audio_query.dart';
import 'package:simphony/common/globel_instance/globel_instance.dart';

Future<List<SongModel>> fetchlastSongs() async {
  final fetchedSongs = await GlobelInstance.ofOnAudio.querySongs(
    sortType: SongSortType.DATE_ADDED,
    orderType: OrderType.DESC_OR_GREATER,
  );

  return fetchedSongs;
}

Future<List<SongModel>> filterSongs(
    Future<List<SongModel>> fetchedSongs) async {
  final filterdsongs = await fetchedSongs;
  return filterdsongs.where((song) {
    final isWhatsAppFile =
        song.data.contains("WhatsApp") || song.displayName.startsWith("PTT");
    final isOpusFile = song.fileExtension == "opus";

    return !isWhatsAppFile && !isOpusFile;
  }).toList();
}
