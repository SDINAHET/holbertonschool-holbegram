import 'package:flutter/material.dart';
import '../../utils/posts.dart';

class Feed extends StatelessWidget {
  const Feed({super.key});

  static const red = Color(0xFFD94335);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        titleSpacing: 0,
        title: Row(
          children: [
            const SizedBox(width: 12),
            const Text(
              'Holbegram',
              style: TextStyle(
                fontFamily: 'Billabong',
                fontSize: 38,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 8),
            Image.asset('assets/images/seahorse.png', height: 26),
            const Spacer(),
            IconButton(
              icon: const Icon(Icons.add, color: Colors.black),
              onPressed: () {},
            ),
            IconButton(
              icon: const Icon(Icons.chat_bubble_outline, color: Colors.black),
              onPressed: () {},
            ),
            const SizedBox(width: 6),
          ],
        ),
      ),
      body: const Posts(),
    );
  }
}
