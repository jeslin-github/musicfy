// import 'package:flutter/material.dart';

// class NowPlayingScreen extends StatefulWidget {
//   final String songTitle;
//   final String artistName;
//   final String albumArtUrl;

//   NowPlayingScreen({
//     required this.songTitle,
//     required this.artistName,
//     required this.albumArtUrl,
//     required String songName,
//   });

//   @override
//   _NowPlayingScreenState createState() => _NowPlayingScreenState();
// }

// class _NowPlayingScreenState extends State<NowPlayingScreen> {
//   bool isPlaying = false;
//   double currentPosition = 0.0;
//   double songDuration = 240.0; // Example song duration in seconds (4 minutes)

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xFF3F2F77),
//       appBar: AppBar(
//         backgroundColor: Colors.transparent,
//         elevation: 0,
//         title: Text('Now Playing', style: TextStyle(color: Colors.white)),
//       ),
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: <Widget>[
//           // Album Art using AssetImage
//           Center(
//             child: CircleAvatar(
//               radius: 120,
//               backgroundImage: AssetImage(
//                   'assets/images/homeimage.jpg'), // Changed to AssetImage
//             ),
//           ),
//           SizedBox(height: 20),

//           // Song Title and Artist Name
//           Text(
//             widget.songTitle,
//             style: TextStyle(
//               fontSize: 24,
//               fontWeight: FontWeight.bold,
//               color: Colors.white,
//             ),
//           ),
//           Text(
//             widget.artistName,
//             style: TextStyle(
//               fontSize: 18,
//               color: Colors.grey[400],
//             ),
//           ),

//           SizedBox(height: 20),

//           // Slider for song progress
//           Slider(
//             value: currentPosition,
//             min: 0,
//             max: songDuration,
//             onChanged: (value) {
//               setState(() {
//                 currentPosition = value;
//               });
//             },
//           ),

//           // Display current position and song duration
//           Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Text(
//                 _formatTime(currentPosition),
//                 style: TextStyle(color: Colors.white),
//               ),
//               Text(
//                 _formatTime(songDuration),
//                 style: TextStyle(color: Colors.white),
//               ),
//             ],
//           ),

//           SizedBox(height: 30),

//           // Play, Previous, and Next Buttons in a Row
//           Row(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               IconButton(
//                 icon: Icon(Icons.skip_previous, size: 40, color: Colors.white),
//                 onPressed: _previousSong,
//               ),
//               SizedBox(width: 20),
//               IconButton(
//                 icon: Icon(
//                   isPlaying
//                       ? Icons.pause_circle_filled
//                       : Icons.play_circle_filled,
//                   size: 70,
//                   color: Colors.green,
//                 ),
//                 onPressed: _togglePlayPause,
//               ),
//               SizedBox(width: 20),
//               IconButton(
//                 icon: Icon(Icons.skip_next, size: 40, color: Colors.white),
//                 onPressed: _nextSong,
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }

//   // Format the time (in seconds) to MM:SS
//   String _formatTime(double time) {
//     int minutes = (time / 60).toInt();
//     int seconds = (time % 60).toInt();
//     return '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}';
//   }

//   // Toggle play/pause state
//   void _togglePlayPause() {
//     setState(() {
//       isPlaying = !isPlaying;
//     });
//   }

//   // Move to the previous song (placeholder)
//   void _previousSong() {
//     // Implement functionality to go to the previous song
//     print('Previous song');
//   }

//   // Move to the next song (placeholder)
//   void _nextSong() {
//     // Implement functionality to go to the next song
//     print('Next song');
//   }
// }
