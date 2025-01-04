import 'package:flutter/material.dart';

class LastAddedCard extends StatelessWidget {
  const LastAddedCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      height: 80,

      // Adjust width for layout consistency
      padding: const EdgeInsets.all(4.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min, // Ensures dynamic height
        children: [
          // Album image
          SizedBox(
            width: double.infinity,
            height: 60,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.asset(
                "assets/image/homeimage.jpg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          // const SizedBox(height: 5),
          // Album name
          const Text(
            'Album Name',
            style: TextStyle(
              fontSize: 10,
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
          // const SizedBox(height: 3),
          // Artist name
          const Text(
            'Song Name',
            style: TextStyle(
              fontSize: 8,
              color: Colors.grey,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}
