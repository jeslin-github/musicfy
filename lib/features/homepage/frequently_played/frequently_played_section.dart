import 'package:flutter/material.dart';
import 'package:simphony/features/homepage/frequently_played/frequently_card.dart';
import 'package:simphony/features/homepage/frequently_played/frequently_songs_screen.dart';
import 'package:simphony/features/homepage/heading.dart';
import 'package:simphony/features/now_playing/now_playing_new.dart';
import 'package:simphony/features/now_playing/nowplaying.dart';

class FrequentlyPlayedSection extends StatelessWidget {
  const FrequentlyPlayedSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      //todo  , sized box, heading ,,text button : see all ,

      // todo sizedbox , listviview horizondal , card
      // todo each card  photo boxfit , footer album name, artist name
      height: 210,
      width: double.infinity,

      child: Column(
        children: [
          Heading(
              title: "Frequently Played",
              screen: () => FrequentlySongsScreen()),
          Container(
            height: 170,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                      onDoubleTap: () {
                        // Navigator.of(context).push(
                        //     MaterialPageRoute(builder: (ctx) => NowPlaying()));
                      },
                      child: FrequentlyCard());
                },
                separatorBuilder: (BuildContext context, int index) {
                  return const SizedBox(
                    width: 10,
                  );
                },
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
