import 'package:flutter/material.dart';
import 'package:simphony/features/library/view/library_screen.dart';
import 'package:simphony/features/favorites/favorites_screen.dart';
import 'package:simphony/features/homepage/home_screen.dart';
import 'package:simphony/features/playlist/playlist_screen.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  State<BottomNav> createState() => _BottomNav();
}

class _BottomNav extends State<BottomNav> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    //todo const
    const HomeScreen(),
   LibraryScreen(),
    FavoriteScreen(),
    PlaylistScreen()

    // const AllSongs(),'
    // const FavouriteSongs(),
    // const Playlist(),
  ];
  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.blueAccent,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        onTap: _onTabTapped,
        type: BottomNavigationBarType.fixed,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.library_music),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favourite',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.playlist_add),
            label: 'Playlist',
          ),
        ],
      ),
    );
  }
}
