// import 'package:flutter/material.dart';
// import 'package:simphony/features/homepage/frequently_played/frequently_songs_screen.dart';
// import 'package:simphony/features/homepage/heading.dart';

// class RecentlyPlayed extends StatelessWidget {
//   const RecentlyPlayed({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 190,
//       width: double.infinity,
//       color: Colors.blue,
//       child: Column(
//         children: [
//           Heading(
//               title: 'Recently Played', screen: () => FrequentlySongsScreen()),
//           Container(
//               height: 150,
//               color: Colors.yellow,
//               child: GridView.builder(
//                 shrinkWrap: true,
//                 scrollDirection: Axis.horizontal,
//                 // physics: const NeverScrollableScrollPhysics(),
//                 gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                   crossAxisCount: 2,
//                   crossAxisSpacing: 8,
//                   mainAxisSpacing: 8,
//                   childAspectRatio: 3 / 2,
//                 ),
//                 padding: const EdgeInsets.symmetric(horizontal: 16),
//                 itemCount: 10,
//                 itemBuilder: (context, index) {
//                   // final item = items[index];
//                   return GestureDetector(
//                     onTap: () {
//                       // Navigator.of(context).push(
//                       //   MaterialPageRoute(builder: (ctx) => item.screen),
//                       // );
//                     },
//                     child: Container(
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(8),
//                         image: DecorationImage(
//                           image: AssetImage("assets/image/homeimage.jpg"),
//                           fit: BoxFit.cover,
//                         ),
//                       ),
//                       child: Container(
//                         padding: const EdgeInsets.all(8),
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(8),
//                           gradient: LinearGradient(
//                             colors: [
//                               Colors.black.withOpacity(0.6),
//                               Colors.transparent,
//                             ],
//                             begin: Alignment.bottomCenter,
//                             end: Alignment.topCenter,
//                           ),
//                         ),
//                         child:const Align(
//                           alignment: Alignment.bottomLeft,
//                           child: Text(
//                             "Album Name",
//                             style: const TextStyle(
//                               color: Colors.white,
//                               fontWeight: FontWeight.bold,
//                               fontSize: 14,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ),
//                   );
//                 },
//               )),
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:simphony/features/homepage/frequently_played/frequently_card.dart';
import 'package:simphony/features/homepage/frequently_played/frequently_songs_screen.dart';
import 'package:simphony/features/homepage/heading.dart';

class RecentlyPlayed extends StatelessWidget {
  const RecentlyPlayed({
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
              title: "Recently Played",
              screen: () => const FrequentlySongsScreen()),
          Container(
            height: 170,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) {
                  return const FrequentlyCard();
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
